cfg=[];
cfg.channel='all';
cfg.elecfile='standard_waveguard64.elc';  % The electrodes are read prior to using this in the structure
cfg.headmodel=Standard2;

cfg.inwardshift=20;              %how much should the innermost surface be moved inward to constrain
                                 %sources to be considered inside the source compartment

cfg.moveinward=20;               %move dipoles inward to ensure a certain distance to the innermost
                                 %surface of the source compartment
                                 
cfg.grid.unit='mm';
sourcemodel=ft_prepare_sourcemodel(cfg) 