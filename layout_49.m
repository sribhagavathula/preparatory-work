function layout = layout_49(headmodel, num_channels, ec)
  cfg = [];
  cfg.elec = ec;
  cfg.headmodel = headmodel;
  cfg.channel = 'all';
  layout = ft_prepare_layout(cfg);
  
  % TODO: make this so that EITHER a window is opeed
  % OR a PNG file is output into the output folder...
  figure;
  ft_plot_lay(layout);
  print(['output/layout_49' num2str(num_channels)], '-dpng','-r300');
  end