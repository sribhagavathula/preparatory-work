function ec_reduced = dropout_electrodes(ec)
  desired_range = [9:23, 33:64];
  ec_reduced = ec;
  
  % overwrite all members we wish to reduce the rows of
  ec_reduced.elecpos = ec.elecpos(desired_range, :);
  ec_reduced.label = ec.label(desired_range, :);
  ec_reduced.chanpos = ec.chanpos(desired_range, :);
  ec_reduced.chantype = ec.chantype(desired_range, :);
  ec_reduced.chanunit = ec.chanunit(desired_range, :);
end
