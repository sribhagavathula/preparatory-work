% ------The configuration structure-------%
cfg=[];
cfg.layout=layout32;
cfg.comment='no';
cfg.layout.pos([33 34],:)=[];       % The stucture consists of 34 channels and -COMNT AND -SCALE labels are removed
cfg.layout.width([33 34],:)=[];
cfg.layout.height([33 34],:)=[];
cfg.layout.label([33 34])=[];
%--------The input data structure---------%
L1=[];
L1.time=0;
L1.dimord='chan_time';
L1.label=cfg.layout.label;
%------Plot first 5 dipoles in x,y,z directions---------%
figure;
for i=1:15
    subplot(5,3,i);
    dipolei=i;  %idx for the dipoles
    L1.avg=L_new(:,dipolei);
    ft_topoplotER(cfg,L1); colorbar
   title(['L(:,' num2str(i) ')']);
end