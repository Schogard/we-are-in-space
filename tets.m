
Corners=[1, 5;1, 2;3, 0;6, 6];
%function to order corners
function [A,B,C,D] = orderCroners(Corners)
%must find corner A by sorting the Corners over the smallest distance to
%0,0, that is to say smallest x2+y2
distances=Corners(:,1).^2 + Corners(:,2).^2
[distances, index_distances]=sort(distances)
xA=Corners(index_distances(1), 1);
yA=Corners(index_distances(1), 2);
A=[xA, yA];
%put A at the beginning of Corners
aux=[Corners(1, 1), Corners(1, 2)]
Corners(index_distances(1), :)=aux
Corners(1, :)=A
%now we must order the B C D such that atan((y-yA)/(x-xA)) is minimal
angles=atan2((Corners(:, 2)-yA), (Corners(:, 1)-xA))
angles(1, :)=[] %delete A
[angles, index_angles]=sort(angles)
%now the last 3 angles correspond to B C and D
B=[Corners(index_angles(2), 1), Corners(index_angles(2), 2)];
C=[Corners(index_angles(3), 1), Corners(index_angles(3), 2)];
D=[Corners(index_angles(4), 1), Corners(index_angles(4), 2)];
end

[A,B,C,D] = orderCroners(Corners)
