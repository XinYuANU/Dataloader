local dl = require 'dataload._env'

-- load ILSVRC2012-14 image classification dataset (A.K.A. ImageNet)
-- http://image-net.org/challenges/LSVRC/2014/download-images-5jj5.php
-- Wraps the Large Scale Visual Recognition Challenge 2014 (ILSVRC2014)
-- classification dataset (commonly known as ImageNet). The dataset
-- hasn't changed from 2012-2014.

function dl.loadPairImages(datapath, filename, imagefolder, loadsize, nthread)

   -- should I do the things all together?
   local train_inputs = dl.ImageClassPairs(datapath, filename, imagefolder, loadsize)
   
   --train_inputs = dl.AsyncIterator(train_inputs, nthread)


   return train_inputs
end
