cfg=[];
cfg.channel='all';
cfg.grid=sourcemodel;     %As prepared in the above step
cfg.elec=ec_reduced;   % The elec structure with definition or the file is called
cfg.headmodel=Standard2;
leadfieldold=ft_prepare_leadfield(cfg); % This is for the original electrode structure with 64 channel configuration