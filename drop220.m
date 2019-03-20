desired1_range = [10:45];
  ec_reduced = ec_origin_256;
  
  % overwrite all members we wish to reduce the rows of
  ec.elecpos = ec_origin_256.elecpos(desired1_range, :);
  ec_reduced.label = ec_origin_256.label(desired1_range, :);
  ec_reduced.chanpos = ec_origin_256.chanpos(desired1_range, :);
  ec_reduced.chantype = ec_origin_256.chantype(desired1_range, :);
  ec_reduced.chanunit = ec_origin_256.chanunit(desired1_range, :);