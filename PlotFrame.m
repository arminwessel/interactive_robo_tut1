function PlotFrame(q)

global angles_alpha;
global distances_d;
global distances_r;


origin=[0;0;0;1];
base_x = [1;0;0;0];
base_y = [0;1;0;0];
base_z = [0;0;1;0];

plot3([origin(1), base_x(1)],[origin(2), base_x(2)],[origin(3), base_x(3)],'Color',[1,0,0],'LineWidth',2);
hold on
plot3([origin(1), base_y(1)],[origin(2), base_y(2)],[origin(3), base_y(3)],'Color',[0,1,0],'LineWidth',2);
plot3([origin(1), base_z(1)],[origin(2), base_z(2)],[origin(3), base_z(3)],'Color',[0,0,1],'LineWidth',2);


g_0E=ComputeDGM(angles_alpha,distances_d,q,distances_r);
new_origin = g_0E*origin
new_x = g_0E*base_x
new_y = g_0E*base_y
new_z =g_0E*base_z


plot3([new_origin(1), new_origin(1)-new_x(1)],[new_origin(2), new_origin(2)-new_x(2)],[new_origin(3), new_origin(3)-new_x(3)],'Color',[1,0,0],'LineWidth',2);
plot3([new_origin(1), new_origin(1)-new_y(1)],[new_origin(2), new_origin(2)-new_y(2)],[new_origin(3), new_origin(3)-new_y(3)],'Color',[0,1,0],'LineWidth',2);
plot3([new_origin(1), new_origin(1)-new_z(1)],[new_origin(2), new_origin(2)-new_z(2)],[new_origin(3), new_origin(3)-new_z(3)],'Color',[0,0,1],'LineWidth',2);
axis equal


plot3([origin(1), new_origin(1)],[origin(2), new_origin(2)],[origin(3), new_origin(3)],'k--','Color',[0.6,0,0.5],'LineWidth',3);
end
