function [lf_origin, lf_target] = prepare_leadfield(sourcemodel, headmodel, ec_origin, ec_target)
  cfg = [];
  
  cfg.channel = 'all';
  cfg.grid = sourcemodel;
  cfg.headmodel = headmodel;
  
  cfg.elec = ec_origin;
  lf_origin = ft_prepare_leadfield(cfg);

  cfg.elec = ec_target;
  lf_target = ft_prepare_leadfield(cfg);
end