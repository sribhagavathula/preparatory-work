function elec_configs = read_waveguard_configs(path)
  files = dir([path '*.elc'])'; % transposing!
  elec_configs = [];

  for file = files
    name = strsplit(file.name, '.');
    name = name {1}; % select the filename before the file extension
    elec_configs.(name) = ft_read_sens([path file.name]);
  end
end