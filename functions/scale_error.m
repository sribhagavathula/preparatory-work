function scale_error(matrix1, matrix2)
  figure;
  error_calculation = (matrix1 - matrix2) ./ matrix2;
  imagesc(error_calculation);
  colorbar;
  % hold on;
  print('output/noname', '-dpng');
end