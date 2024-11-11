Corners = [ 156, 315;283, 297; 339, 270;31, 30]
A=[31, 30]
B=[339, 270]
C=[283, 297]
D=[156, 315]
Width=max(Corners(:, 1))
Height=max(Corners(:, 2))
%corner A goes to 0 0
%corner B goes to W 0
%corner C goes to W H
%corner D goes to 0 H
matrix=[A(1), A(2), 1, 0, 0, 0, -A(1)*0, -A(2)*0;
        0, 0, 0, A(1), A(2), 1, -A(1)*0, -A(2)*0;
        B(1), B(2), 1, 0, 0, 0, -B(1)*Width, -B(2)*Width;
        0, 0, 0, B(1), B(2), 1, -B(1)*0, -B(2)*0;
        C(1), C(2), 1, 0, 0, 0, -C(1)*Width, -C(2)*Width;
        0, 0, 0, C(1), C(2), 1, -C(1)*Height, -C(2)*Height;
        D(1), D(2), 1, 0, 0, 0, -D(1)*0, -D(2)*0;
        0, 0, 0, D(1), D(2), 1, -D(1)*Height, -D(2)*Height;]
b=[0; 0; Width; 0; Width; Height; 0; Height]
x=matrix\b
M=[x(1), x(2), x(3);
    x(4), x(5), x(6);
    x(7), x(8), 1
    ]