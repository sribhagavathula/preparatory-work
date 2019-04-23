addpath('functions'); % Make the 'functions' folder accessible to this script...
options = [];
thesis_config;
save_workspace = true; % Just a helper variable...

if isfile([options.workspace '.mat']) && options.load_workspace
  disp(['Loading saved workspace from ' options.workspace])
  tmp_options = options;
  load(options.workspace);
  options = tmp_options;
  clear tmp_options;
  save_workspace = false;
else
  % Due to a slightly off electrode and headmodel combination, I refrained
  % from using my headmodel 'bemcp'. So instead, load Melanie Knorr's
  % headmodel, which is in ASA format.
  headmodel = ft_headmodel_asa('input/headmodels/melanie/standard2.vol');
  % Next, we'll need electrode configurations.
  ec = read_waveguard_configs('input/electrode_configurations/');
  ec.origin = ec.waveguard32;
  ec.target = ec.waveguard64;
  
  % ec.target = create_rand_ec_transform(ec.origin); % To be continued...
  
  % With the above input data, a couple of things need to be done:
  %
  % - create a source model
  % - create a 64 electrode lead field matrix (as per my example this is the
  %   original electrode configuration!)
  % - create a 32 electrode lead field matrix (as per my example, this is the
  %   target electrode configuration!)
  %
  % The following functions are not implemented in this file, but
  % in corresponding .m files in the `functions subfolder.
  addpath('functions');
  sourcemodel = create_sourcemodel(headmodel, ec.waveguard64);
  [lf_origin, lf_target] = prepare_leadfields(sourcemodel, headmodel, ec.origin, ec.target);
  [L_old, L_new, lf_target_matrix] = compare_leadfields(lf_origin, lf_target);
end

% -------------------------------------------------------------------------

if options.run_plots
  disp('Running all plots, this may take a while...')
  plot_sourcemodel(headmodel, sourcemodel, options);
  layout_origin = plot_layout(headmodel, 64, ec.origin, options);
  layout_target = plot_layout(headmodel, 32, ec.target, options);
  plot_scalp_potentials(layout_origin, 64, L_old, options);
  plot_scalp_potentials(layout_target, 32, L_new, options);
  plot_bnds(headmodel, options)
  plot_electrode_positions(headmodel, ec.origin, options);
  plot_errorfunction(lf_target_matrix, L_new, options);
  plot_dropout(headmodel, dropout_electrodes(ec.origin), options);
end

if false ~= save_workspace
  disp(['Saving workspace to ' options.workspace])
  save(options.workspace);
end
clear save_workspace;