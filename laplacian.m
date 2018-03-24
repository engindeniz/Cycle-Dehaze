function laplacian(input, original, out)

  liste = dir([input]);

  for i=3:size(liste,1)
    A = double(imread([original '/' liste(i).name]));
    C = double(imread([input '/' liste(i).name]));
 
    Ad1 = impyramid(A, 'reduce');
    Ad2 = impyramid(Ad1, 'reduce');
    Ad3 = impyramid(Ad2, 'reduce');
    Ad4 = impyramid(Ad3, 'reduce');

    L1 = A - imresize(Ad1, [size(A,1), size(A,2)]);
    L2 = Ad1 - imresize(Ad2, [size(Ad1,1), size(Ad1,2)]);
    L3 = Ad2 - imresize(Ad3, [size(Ad2,1), size(Ad2,2)]);
    L4 = Ad3 - imresize(Ad4, [size(Ad3,1), size(Ad3,2)]);

    Cu1 = imresize(C, [size(Ad3,1), size(Ad3,2)]) + L4;
    Cu2 = imresize(Cu1, [size(Ad2,1), size(Ad2,2)]) + L3;
    Cu3 = imresize(Cu2, [size(Ad1,1), size(Ad1,2)]) + L2;
    Cu4 = imresize(Cu3, [size(A,1), size(A,2)]) + L1;

    imwrite(uint8(Cu4), [out '/' liste(i).name], 'Mode', 'lossless')
  end
  exit
end
