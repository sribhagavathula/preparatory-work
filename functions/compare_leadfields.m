function [L_old, L_new, lf_target_matrix, transfer_matrix] = compare_leadfields(lf_origin, lf_target)
  % To condense all cells into one
  lf_origin_matrix = cell2mat(lf_origin.leadfield);
  lf_target_matrix = cell2mat(lf_target.leadfield);
  
  % Singular Value Decomposition of the original electrode set
  [U, W, V] = svd(lf_origin_matrix);
  % Regularisation of the off-diagonal parts of the matrix W
  threshold = sum(W(:)) / 1000;
  % All the values of W are set to 0 apart from the main diagonal
  W(W < threshold) = 0;
  L_old = U * W * V';
  % Pseudo-inverse of the original leadfield is calculated
  transfer_matrix = lf_target_matrix * pinv(L_old);
  
  % For convenience's sake the entire time course was not plotted
  L_new = transfer_matrix * L_old;
end