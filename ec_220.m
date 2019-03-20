  desired_range = [10:45];
  ec_reduced = ec_origin_256;
  
  % overwrite all members we wish to reduce the rows of
  ec_elecpos = ec_origin_256.elecpos(desired_range, :);
  ec_reduced.label = ec_origin_256.label(desired_range, :);
  ec_reduced.chanpos = ec_origin_256.chanpos(desired_range, :);
  ec_reduced.chantype = ec_origin_256.chantype(desired_range, :);
  ec_reduced.chanunit = ec_origin_256.chanunit(desired_range, :);

