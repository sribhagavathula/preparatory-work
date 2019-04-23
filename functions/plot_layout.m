function layout = plot_layout(headmodel, num_channels, ec, opts)
  cfg = [];
  cfg.elec = ec;
  cfg.headmodel = headmodel;
  cfg.channel = 'all';
  layout = ft_prepare_layout(cfg);
  
  % TODO: make this so that EITHER a window is opened
  % OR a PNG file is output into the output folder...
  figure('visible', opts.figure_windows);
  ft_plot_lay(layout);
  print(['output/layout_' num2str(num_channels)], '-dpng','-r300');
end