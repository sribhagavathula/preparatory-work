cfg=[];
cfg.headmodel=Standard2;
cfg.dip.mom = [1 0 0] ;
cfg.dip.pos= [-27.2824 -3.7807 75.5864];
cfg.dip.frequency=10;
cfg.ntrials =1;
cfg.triallength =0.15; 
cfg.fsample =1000; 
cfg.dip.amplitude=1.0;
cfg.headmodel=Standard2;
cfg.elec=elec64;
cfg.grid= sourcemodel;
raweeg1=ft_dipolesimulation(cfg)
