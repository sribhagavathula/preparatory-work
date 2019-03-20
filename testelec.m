dirlist  = dir('template/electrode/EEG1010.lay') 
filename = {dirlist(~[dirlist.isdir]).name}
for i=1:length(EEG1010.lay)
cfg=[];
cfg.layout=EEG1010.lay{i};
layout=ft_prepare_layout(cfg);
figure
ft_plot_lay(layout);
h=title(EEG1010.lay{i});
set(h,'Interpreter','none');
[p, f, x]=fileparts(EEG1010.lay{i});
print([lower(f) '.png'], '-dpng');
end