axs = axes;
view(3);
daspect([1 1 1]);
h = triad('Parent',axs,'Scale',10,'LineWidth',3,...
  'Tag','Triad Example','Matrix',...
  makehgtform('xrotate',pi/4,'zrotate',pi/3,'translate',[1,2,3]));
H = get(h,'Matrix');
for theta = 0:360
  set(h,'Matrix',H*makehgtform(...
      'xrotate',deg2rad(theta),'zrotate',deg2rad(theta)));
  drawnow
end