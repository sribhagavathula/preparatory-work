function plot_scalp_potentials(layout, num_channels, matrix, opts)
  % The stucture consists of num_channels and '-COMNT' AND '-SCALE' labels are removed
  structure = [num_channels+1, num_channels+2];
  
  cfg1=[];
  cfg1.layout = layout;
  cfg1.comment = 'no';
  
  cfg1.layout.pos(structure, :) = [];
  cfg1.layout.width(structure, :) = [];
  cfg1.layout.height(structure, :) = [];
  cfg1.layout.label(structure) = [];
  
  % The input data structure
  cfg2 = [];
  cfg2.time = 0;
  cfg2.dimord = 'chan_time';
  cfg2.label = cfg1.layout.label;

  % Plot 5 rows and 3 columns of dipoles
  figure('visible', opts.figure_windows);
  num_dipoles = 15;
  for i = 1:num_dipoles
    subplot(5, 3, i);
    cfg2.avg = matrix(:, i);
    ft_topoplotER(cfg1, cfg2);
    colorbar;
    title(['dipole #' num2str(i)]);
  end
  print(['output/scalp_potentials_' num2str(num_channels)], '-dpng');
end