num_channels=256;
 structure = [num_channels+1, num_channels+2];
  
  cfg1=[];
  cfg1.layout = layout_256;
  cfg1.comment = 'no';
  
  cfg1.layout.pos(structure, :) = [];
  cfg1.layout.width(structure, :) = [];
  cfg1.layout.height(structure, :) = [];
  cfg1.layout.label(structure,:) = [];
  
  % The input data structure
  cfg2 = [];
  cfg2.time = 0;
  cfg2.dimord = 'chan_time';
  cfg2.label = cfg1.layout.label;

  % Plot 5 rows and 3 columns of dipoles
  
 figure;
  num_dipoles = 15;
  for j= 1:num_dipoles
    subplot(5, 3, j);
    cfg2.avg = L_old(:, j);
    ft_topoplotER(cfg1, cfg2);
    colorbar;
    title(['dipole #' num2str(j)]);
  end
 