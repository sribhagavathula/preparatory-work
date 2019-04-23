function sm = create_sourcemodel(headmodel, electrode_configuration)
  cfg = [];
  cfg.channel = 'all';
  cfg.elec = electrode_configuration;
  cfg.headmodel = headmodel;

  cfg.inwardshift = 10; % How much should the innermost surface be moved inward to constrain
                        % sources to be considered inside the source compartment

  cfg.moveinward = 10;  % Move dipoles inward to ensure a certain distance to the innermost
                        % surface of the source compartment

  cfg.grid.unit='mm';
  sm = ft_prepare_sourcemodel(cfg);
end