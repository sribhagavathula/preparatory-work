function [transfer_matrix, data_old, data_interpolated, data_tar] = apply_interpolation(data_sim, data_tar)
  % Singular Value Decomposition of the original electrode set
  [U, W, V] = svd(data_sim);
  % Regularisation of the off-diagonal parts of the matrix W
  threshold = sum(W(:)) / 1000;
  % All the values of W are set to 0 apart from the main diagonal
  W(W < threshold) = 0;
  data_old = U * W * V';
  % Pseudo-inverse of the original leadfield is calculated
  transfer_matrix = data_tar * pinv(data_old);
  
  % For convenience's sake the entire time course was not plotted
  data_interpolated = transfer_matrix * data_old;
end