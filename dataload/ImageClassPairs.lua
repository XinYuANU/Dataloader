------------------------------------------------------------------------
-- Need to rewrite rockspec file and then add your own class.
------------------------------------------------------------------------
local dl = require 'dataload._env'
local ImageClassPairs, parent = torch.class('dl.ImageClassPairs', 'dl.DataLoader', dl)

function ImageClassPairs:__init(datapath, filename, imagefolder, loadsize, samplefunc)

   -- size to load the images to, initially
   self.loadsize = loadsize   
   assert(torch.type(self.loadsize) == 'table') 
   self.samplesize = self.loadsize   
     
   -- function f(self, dst, path) used to create a sample(s) from 
   -- an image path. Stores them in dst. Strings "sampleDefault"
   -- "sampleTrain" or "sampleTest" can also be provided as they
   -- refer to existing functions
   self.samplefunc = samplefunc or 'sampleDefault'

   -- display verbose messages
   self.verbose = nil
   
   -- will need this package later to load images (faster than image package)
   --require 'graphicsmagick'
    
   -- find the image path names
   self.imagePath_inputs = {}  -- path to each image in dataset  
   self.datapath = datapath
   self.filename = filename
   self.imagefolder = imagefolder
   
   -- read from datasetpath_txt
	file = io.open(paths.concat(datapath, filename))
	if file then
		for image_name in file:lines() do
			--print(image_file_path)
			table.insert(self.imagePath_inputs, image_name)
		end
	end
	file:close()
	--print(self.imagePath_inputs)
end

function ImageClassPairs:reset()
   parent.reset(self)
   self.imgBuffer = nil
end

function ImageClassPairs:index(indices, inputs, targets, samplefunc)
   local imagepaths_input = {} 
   
   samplefunc = samplefunc or self.samplefunc
   if torch.type(samplefunc) == 'string' then
      samplefunc = self[samplefunc]
   end

   local inputTable = {}
   for i = 1, indices:size(1) do
      local idx = indices[i]
      -- load the sample
      local imgpath_input = paths.concat(self.datapath, self.imagefolder, self.imagePath_inputs[idx])
      imagepaths_input[i] = imgpath_input

      local dst_input = self:getImageBuffer(i)
	  
      -- note that dst may have different sizes at this point
      dst_input = samplefunc(self, dst_input, imgpath_input)

      table.insert(inputTable, dst_input)
   end

   inputs = inputs or torch.FloatTensor()

   self:tableToTensor(inputTable, inputs)

   self:collectgarbage()
   return inputs, nil, nil
end

-- converts a table of samples (and corresponding samples) to tensors
function ImageClassPairs:tableToTensor(inputTable, inputTensor)
   assert(inputTable and inputTensor)
   local n = #inputTable

   local samplesPerDraw = inputTable[1]:dim() == 3 and 1 or inputTable[1]:size(1)
   inputTensor:resize(n, samplesPerDraw, unpack(self.samplesize))
   
   for i=1,n do
      inputTensor[i]:copy(inputTable[i])
   end
   
   inputTensor:resize(n*samplesPerDraw, unpack(self.samplesize))
   
   return inputTensor
end

function ImageClassPairs:loadImage(path)
   -- https://github.com/clementfarabet/graphicsmagick#gmimage
--   local gm = require 'graphicsmagick'
--   local lW, lH = self.loadsize[3], self.loadsize[2]
   -- load image with size hints
--   local input = gm.Image():load(path, self.loadsize[3], self.loadsize[2])
   -- resize by imposing the smallest dimension (while keeping aspect ratio)
   -- input:size(nil, math.min(lW,lH))
   local input  = image.load(path, 3, 'float')   
   return input
end

function ImageClassPairs:getImageBuffer(i)
   self.imgBuffers = self.imgBuffers or {}
   self.imgBuffers[i] = self.imgBuffers[i] or torch.FloatTensor()
   return self.imgBuffers[i]
end

-- just load the image and return it
function ImageClassPairs:sampleDefault(dst, path)
   if not path then
      path, dst = dst, nil
   end
   dst = dst or torch.FloatTensor()
   -- TODO if loadsize[1] == 1, converts to greyscale (y in YUV)
   local input = self:loadImage(path)
   dst:resizeAs(input):copy(input)
   return dst
end

-- function to load the image, jitter it appropriately (random crops etc.)
function ImageClassPairs:sampleTrain(dst, path)
   if not path then
      path, dst = dst, nil
   end
   dst = dst or torch.FloatTensor()
   
   local input = self:loadImage(path)
   local colorspace = self.samplesize[1] == 1 and 'I' or 'RGB'
   out = out:toTensor('float',colorspace,'DHW', true)
   dst:resizeAs(out):copy(out)
   return dst
end