% Control the dipole orientation between 0 and 2*pi radians...
% Unit sphere is considered so r=1...
num_dip=1;
rand_values=2*rand(num_dip,1)-1; % scale values between [-1,1]
phi=asin(rand_values); % scale between [-pi/2,pi/2]
theta=2*pi*rand(num_dip,1); % scale values between[0 2*pi]
[x,y,z]=sph2cart(theta,phi,1); % radius=1
% Algorithm
% phi is elevation
% theta is azimuth
% x = r .* cos(elevation) .* cos(azimuth)
% y = r .* cos(elevation) .* sin(azimuth)
% z = r .* sin(elevation)