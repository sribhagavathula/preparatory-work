%% Reading mri data for further building of BEM model%%
mri=ft_read_mri('Subject01.mri');
disp(mri)
%% Segmenting the anatomical mri model into brain, skull and scalp
%% respectively%%
cfg=[];
cfg.output={'brain', 'skull','scalp'};
segmentedmri=ft_volumesegment(cfg,mri);
save segmentedmri segmentedmri
disp(segmentedmri)
%% Preparing mesh for the segmented data in the above step
cfg=[];
cfg.tissue={'brain','skull','scalp'};
cfg.numvertices=[3000 2000 1000];
bnd=ft_prepare_mesh(cfg,segmentedmri);
save bnd bnd
disp(bnd(1))
%% Preparing head model using 'bemcp' 
cfg=[];
cfg.method= 'bemcp';
vol=ft_prepare_headmodel(cfg,bnd);
save vol vol
disp(vol)
%% Visualization for individual figures
figure;
ft_plot_mesh(vol.bnd(3),'facecolor','none'); %scalp
figure;
ft_plot_mesh(vol.bnd(2),'facecolor','none'); %skull
figure;
ft_plot_mesh(vol.bnd(1),'facecolor','none'); %brain
%% Visualizing all three together%%
ft_plot_mesh(vol.bnd(1),'edgecolor','none','facecolor',[0.4 0.6 0.4]);
hold on;
ft_plot_mesh(vol.bnd(2),'edgecolor','none','facealpha',0.4);
hold on;
ft_plot_mesh(vol.bnd(3), 'facecolor',[0.2 0.2 0.2], 'facealpha', 0.3, 'edgecolor', [1 1 1], 'edgealpha', 0.05);
%% Align the electrodes with the scalp only
%% FieldTrip/template/electrode/standard_1020.elc
elec=ft_read_sens('standard_1020.elc');
disp(elec)
%% Load volume conduction model
load vol;
figure;
% head surface(scalp)
ft_plot_mesh(vol.bnd(3), 'edgecolor','none','facealpha',0.8,'facecolor',[0.6 0.6 0.8]);
hold on;
% electrodes
ft_plot_sens(elec,'style','k.');
%% Align the electrodes 
mri = ft_read_mri('Subject01.mri');
disp(mri.hdr.fiducial.mri)
% Warp the anatomical mri to the template electrode positions in the ctf
% coordinate system
nas=mri.hdr.fiducial.mri.nas;
lpa=mri.hdr.fiducial.mri.lpa;
rpa=mri.hdr.fiducial.mri.rpa;
 
transm=mri.transform;
 
nas=ft_warp_apply(transm,nas, 'homogenous');
lpa=ft_warp_apply(transm,lpa, 'homogenous');
rpa=ft_warp_apply(transm,rpa, 'homogenous');   
%% Now align the template set of electrodes to the ctf coordinates that we
%% obtained from the anatomical MRI
% create a structure similar to a template set of electrodes
fid.elecpos       = [nas; lpa; rpa];       % ctf-coordinates of fiducials
fid.label         = {'Nz','LPA','RPA'};    % same labels as in elec 
fid.unit          = 'mm';                  % same units as mri
 
% alignment2
cfg               = [];
cfg.method        = 'fiducial';            
cfg.target        = fid;                   
cfg.elec          = elec;
cfg.fiducial      = {'Nz', 'LPA', 'RPA'};  % labels of fiducials in fid and in elec
elec_aligned      = ft_electroderealign(cfg);
save elec_aligned elec_aligned;
figure;
ft_plot_sens(elec_aligned,'style','k.');
hold on;
ft_plot_mesh(vol.bnd(3),'facealpha', 0.85, 'edgecolor', 'none', 'facecolor', [0.65 0.65 0.65]); %scalp
%%  INTERACTIVE ALIGNMENT
cfg           = [];
cfg.method    = 'interactive';
cfg.elec      = elec_aligned;
cfg.headshape = vol.bnd(3); %shape
elec_aligned  = ft_electroderealign(cfg); % the x-axis was translated by around 10-12 mm to get the final result
