function plot_sourcemodel(headmodel, sourcemodel, opts)
  figure('visible', opts.figure_windows);
  hold on;
  ft_plot_mesh(headmodel.bnd(3), 'facecolor', 'none');
  ft_plot_mesh(sourcemodel.pos(sourcemodel.inside, :));
  print('output/sourceplot', '-dpng', '-r300');
end