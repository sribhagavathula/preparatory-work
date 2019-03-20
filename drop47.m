desired1_range = [1:45, 50:64];
  ec_reduced = ec.waveguard64;
  
  % overwrite all members we wish to reduce the rows of
  ec_reduced.elecpos = ec.waveguard64.elecpos(desired1_range, :);
  ec_reduced.label = ec.waveguard64.label(desired1_range, :);
  ec_reduced.chanpos = ec.waveguard64.chanpos(desired1_range, :);
  ec_reduced.chantype = ec.waveguard64.chantype(desired1_range, :);
  ec_reduced.chanunit = ec.waveguard64.chanunit(desired1_range, :);