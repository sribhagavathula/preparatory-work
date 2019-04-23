function plot_errorfunction(matrix1, matrix2, opts)
  figure('visible', opts.figure_windows);
  error_calculation = (matrix1 - matrix2) ./ matrix2;
  imagesc(error_calculation);
  colorbar;
  % hold on;
  print('output/error_calculation', '-dpng');
end