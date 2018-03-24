function resize_im(input, output)

   liste = dir(input);

   for i=3:size(liste,1)
     C = imresize(imread([input '/' liste(i).name]), [256,256]);
     imwrite(C, [output '/' liste(i).name], 'Mode', 'lossless')
   end
   exit
end

