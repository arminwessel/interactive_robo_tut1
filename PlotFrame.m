function PlotFrame(q)

global angles_alpha;
global distances_d;
global distances_r;


origin=[0;0;0;1];
scale=0.2;
base_x = [1;0;0;0];
base_y = [0;1;0;0];
base_z = [0;0;1;0];

plot3([origin(1), scale*base_x(1)],[origin(2), scale*base_x(2)],[origin(3), scale*base_x(3)],'Color',[1,0,0],'LineWidth',2);
hold on
plot3([origin(1), scale*base_y(1)],[origin(2), scale*base_y(2)],[origin(3), scale*base_y(3)],'Color',[0,1,0],'LineWidth',2);
plot3([origin(1), scale*base_z(1)],[origin(2), scale*base_z(2)],[origin(3), scale*base_z(3)],'Color',[0,0,1],'LineWidth',2);

g_0E=ComputeDGM(angles_alpha,distances_d,q+[0;0;pi/2;0;0;0],distances_r);
new_origin = g_0E*origin;
new_x = g_0E*base_x;
new_y = g_0E*base_y;
new_z =g_0E*base_z;


plot3([new_origin(1), new_origin(1)-scale*new_x(1)],[new_origin(2), new_origin(2)-scale*new_x(2)],[new_origin(3), new_origin(3)-scale*new_x(3)],'Color',[1,0,0],'LineWidth',2);
plot3([new_origin(1), new_origin(1)-scale*new_y(1)],[new_origin(2), new_origin(2)-scale*new_y(2)],[new_origin(3), new_origin(3)-scale*new_y(3)],'Color',[0,1,0],'LineWidth',2);
plot3([new_origin(1), new_origin(1)-scale*new_z(1)],[new_origin(2), new_origin(2)-scale*new_z(2)],[new_origin(3), new_origin(3)-scale*new_z(3)],'Color',[0,0,1],'LineWidth',2);
axis equal
axis on


plot3([origin(1), new_origin(1)],[origin(2), new_origin(2)],[origin(3), new_origin(3)],'k--','Color',[0.6,0,0.5],'LineWidth',3);

end

