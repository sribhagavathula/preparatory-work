function plot_electrode_positions(headmodel, electrode_configuration, opts)
  figure('visible', opts.figure_windows)
  ft_plot_sens(electrode_configuration, 'style', '.');
  % hold on;
  ft_plot_mesh(headmodel.bnd(1), ...
    'facealpha', 0.85,           ...
    'edgecolor', 'none',         ...
    'facecolor', [0.65 0.65 0.65]); %scalp

  print('output\plot_elecscalp','-dpng','-r300');
end