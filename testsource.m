cfg=[];
cfg.method='asa';
cfg.conductivity=[0.3300 0.0041 0.3300];
cfg.headmodel=Standard2;
cfg.tissue={'brain', 'skull', 'scalp'};
cfg.grid.unit='mm';
grid1=ft_prepare_sourcemodel(cfg,vol);
save grid1 grid1;