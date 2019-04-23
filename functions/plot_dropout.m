function plot_dropout(hm, ec, opts)
  cfg = [];
  cfg.elec = ec;
  cfg.headmodel = hm;
  cfg.channel = 'all';

  layout = ft_prepare_layout(cfg);
  
  figure('visible', opts.figure_windows);
  ft_plot_lay(layout);
  print('output/dropout', '-dpng');
end