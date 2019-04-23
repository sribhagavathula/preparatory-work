%% Creating a cortex segmentation on segmented mri done previously
cfg=[];
cfg.mri=segmentedmri;
cfg.threshold=0.1;
cfg.smooth=5;
cfg.grid.unit='mm';
grid=ft_prepare_sourcemodel(cfg);
save grid grid;
