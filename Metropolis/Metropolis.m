%Metropolis et al Algorithm.
%Implementation:Guneykan Ozgul

%Set initial Points.
initialX=-3;
initialY=-3;
current(1)=initialX;
current(2)=initialY;

%Set displacement.
delta=1.2;

%Set number of random points.
n=1000000;   

%Store each component and radius seperately.
radius=zeros(n,1);
xPoints=zeros(n,1);
yPoints=zeros(n,1);

%Store number of accepted points as a performance measure.
accepted=0;
    
for i= 1: n 
        
        %Choose test point.
        test(1)=delta*(2*rand-1)+current(1);
        test(2)=delta*(2*rand-1)+current(2);
        %Calculate ratio.
        ratio=P(norm(test))/P(norm(current));

        %Decide if the point should be accepted or not.
        if( ratio > rand)
            current=test;
            accepted=accepted+1;
        end
        
        %Set the next point.
        xPoints(i)=current(1);
        yPoints(i)=current(2);
        radius(i)=norm(current);
    
end


%Plot the figures.
figure
histogram(xPoints,100,'Normalization','pdf');
xlabel('x');
ylabel('# of points')
hold on ;
fplot(@(x) sqrt(pi)*P(x),[-3 3])
figure
histogram(yPoints,100,'Normalization','pdf'); %// plot histogram
xlabel('y');
ylabel('# of points')
hold on;
fplot(@(y) sqrt(pi)*P(y),[-3 3])
figure
histogram(radius,100,'Normalization','pdf'); %// plot histogram
xlabel('r');
ylabel('# of points')
hold on;
fplot(@(r) 2*pi*r*P(r),[0 3])
