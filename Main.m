%colour formatting from labview (dividing by 255)
colours=[r; g; b]
colours=colours.'
colours=colours./255

% Main function
%function Main(filename, Curve, Corners)
    % get width and height of image
    Width=max(Corners(:, 1))
    Height=max(Corners(:, 2))
    legstring=[] %legend to construct
    f=figure, %figure to draw
    % 1. Step: Order Corners
    [A,B,C,D] = orderCorners(Corners);

    % 2. Step: Calculate Matrix
    M = computeM(A, B, C, D, Width, Height);

    for i = 1:length(T) %for all traces, to calculate the fit and to plot the fit
        Curves=cell2mat(T(i));
        X = Curves(:,1);
        Y = Curves(:,2);

        % 3. Step: Apply M
        [x y] = applyM(M, X, Y);

        % 4. Step: Fit curve
        [ParamStr yfitted] = FindTrace(x, y, Width, Height);

        %Step 5, plotting
        %plot fitted line (data needs to be sorted by x so it can fit the
        %lines)
        %resize the original data so it fits on the graph (W=1s, H=2v)
        xresized=x./Width
        yresized=y./(0.5*Height)-1
        %plot the fitted data
        [xsort, index]=sort(xresized)
        ysort=yfitted(index)
        plot(xsort, ysort, 'color', colours(i,:));
        %construct the legend
        legstring=[legstring ParamStr]
        hold on;
    end
    %output the legend
    lgd=legend(legstring)
    lgd.AutoUpdate ="off";
    lgd.Location='southoutside'
    %6. Step plot original data
    for i = 1:length(T) %for all traces
        Curves=cell2mat(T(i));
        X = Curves(:,1); 
        Y = Curves(:,2);
        [x y] = applyM(M, X, Y);
        %resize the original data so it fits on the graph (W=1s, H=2v)
        xresized=x./Width
        yresized=y./(0.5*Height)-1
        %plot original data points
        plot(xresized, yresized, optionmarker, 'color', colours(i, :), 'MarkerSize', sizemarker);
        hold on;
    end
    hold off;

    %add title
    [filepath,name,ext] = fileparts(filename)
    t=datestr(datetime)
    titre=strcat("SRC : ‘", name, ext, "’ @ ", t)
    title(titre)
    %add grid lines and axis labels
    grid on;
    xticks(0:0.1:1)
    yticks([-1:0.2:1])
    axis([0 1 -1 1])
    yline(0);
    xline(0.5);
    xlabel("0.1[s]/div")
    ylabel("0.2[v]/div")
    %7. Step pdf file
    pdffilename=strcat(name, ".pdf")
    saveas(f, pdffilename)
    %TODO axis labeling, main axis highlighted
%end
%end of main function


% function to apply M to "untangle" the coordinates to homogenuous coordinates
function [x y] = applyM(M, X, Y) 
    point = [X Y]     
    point(:, end+1)=1       % homogenuous coordinates
    newpoint= M*point.';
    point_transformed=newpoint.';
    x=point_transformed(:, 1)./point_transformed(:, 3)
    y=point_transformed(:, 2)./point_transformed(:, 3)
end



% function to compute matrix M
function M = computeM(A,B,C, D, Width, Height)
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
    
    % Matrix division Ax=b => x = A\b
    x=matrix\b 
    M=[x(1), x(2), x(3);
        x(4), x(5), x(6);
        x(7), x(8), 1
        ] 
end



function  [ParamStr, yfitted] = FindTrace(X, Y, Width, Height)
    %resize the data such that width is 1s and height is 2v
    X=X./(Width)
    Y=Y./(Height*0.5)-1
    %plot(X, Y, 'ob'); DEBUG
    %hold on;
    %try plotting a sine
    %to find frequency, approximate as a 12deg polyn
    [Xsort, index]=sort(X)
    Ysort=Y(index)
    polyn = polyfit(Xsort,Ysort,12);
    %find the points where the polyn is mean(Y)
    polyn(end)=polyn(end)-mean(Y) %to solve polym=mean(Y)
    sols=roots(polyn)
    Xmax=max(X);
    sols=sols(find(0<sols & sols<Xmax & conj(sols)==sols)) %check if solutions are in domain and real
    if length(sols)<3 & 1<length(sols)
        dist=sols(end)-sols(end-1)
    elseif length(sols)==1 %this is probably gonna be a polynomial
            dist=max(X)-min(X)
    else dist=sols(end-1)-sols(end-2)
    end

    opts = fitoptions('Method','NonlinearLeastSquares');
    ft=fittype('a*sin(b*x+c)+d');
    [sortY, index]=sort(Y, 'descend');
    omega=dist
    opts.StartPoint=[abs((max(Y)-min(Y))/2), pi/abs(omega), Y(1), mean(Y)]
    [fitResult, gofsine, output] = fit(X, Y, ft, opts );
    %plot(fitResult); DEBUG
    %try plotting a 4 degree polynomial
    [polyn4, gofpolyn] = fit(Xsort,Ysort,'poly4');
    %check the gofs and pick the lowest one
    if gofpolyn.rmse< gofsine.rmse
        %output polynomial coefficients
        ParamStr=sprintf("a4: %.2f, a3: %.2f, a2: %.2f, a1: %.2f, RMSE: %.2f", polyn4(1), polyn4(2), polyn4(3), polyn4(4), gofpolyn.rmse)
        yfitted=polyn4(X);
    else
        %output afpo of sine in paramstr
        ParamStr=sprintf("A: %.2f[v], DC: %.2f[v], F: %.2f[Hz], P: %.2f [deg], RMSE: %.2f", fitResult.a, fitResult.d, fitResult.b/(2*pi), rad2deg(fitResult.c), gofsine.rmse)
        yfitted=fitResult(X);
    end
end


%function to order corners
function [A,B,C,D] = orderCorners(Corners)
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
angles=atan2((Corners(:, 2)-yA),(Corners(:, 1)-xA))
angles(1, :)=[] %delete A
%we copy corners and we delete A from it as well
CornersCopy=Corners;
CornersCopy(1, :)=[] %delete A
[angles, index_angles]=sort(angles)
%now the last 3 angles correspond to B C and D
B=[CornersCopy(index_angles(1), 1), CornersCopy(index_angles(1), 2)];
C=[CornersCopy(index_angles(2), 1), CornersCopy(index_angles(2), 2)];
D=[CornersCopy(index_angles(3), 1), CornersCopy(index_angles(3), 2)];
end
   