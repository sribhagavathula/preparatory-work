% Simulate time series EEG-data by controlling source level parameters:
 
% ---------------------------------------------------------------------------------
% Choose a random dipole position from the whole source space.

%num_dip=1;
%dippos=sourcemodel.pos(:,:); % The entire sourcemodel is copied to dippos
%rand_pos=randi(size(dippos,1),1,num_dip); % A random dipole position is chosen
%----------------------------------------------------------------------------------
% Choose a random orientation for the dipole between (0~2*pi)

%rand_values=2*rand(num_dip,1)-1; % scale values between [-1,1]
%phi=asin(rand_values); % scale between [-pi/2,pi/2]
%theta=2*pi*rand(num_dip,1); % scale values between[0 2*pi]
%[x,y,z]=sph2cart(theta,phi,1);
%----------------------------------------------------------------------------------
% Choose a random dipole amplitude between (0~3)

%cfg.dip.amplitude=3*rand(num_dip,1);
%amplitude=cfg.dip.amplitude;
%----------------------------------------------------------------------------------
% Choose any SNR between (0~40)

% create a dipole simulation with one dipole 

cfg      = [];
cfg.headmodel  = Standard2;             % see above
cfg.elec = e; % see above
cfg.dip.pos=sourcemodel.pos(273,:);
cfg.dip.mom= [-0.46 -0.64 0.61]'; % coordinate axes in which the dipole is aligned
                       % note, it should be transposed. 
  
cfg.dip.amplitude=0.62; % Dipole amplitude between (0~3)
%cfg.ntrials = 1;
%cfg.triallength = 1;     % seconds
%cfg.fsample = 250;   % Hz
% Check the source code
cfg.relnoise=0; % add noise to simulated data based on chosen SNR
cfg.absnoise=0; 
cfg.highlight='on';
cfg.highlightchannel=idx;
cfg.highlightcolor='red';
cfg.highlightsize=6;
raw1 = ft_dipolesimulation(cfg);
avg1 = ft_timelockanalysis([], raw1);  

% -------------------------------------------------------------------------------------------
 

