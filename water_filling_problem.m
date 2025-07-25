% Water filling problem.
% This script constructs a random water filling 
% problem and solves it using CVX. 

% Reproductibility
rng(0) 

% Generate data
n = 10;
h = abs(randn(n,1));
pb = 100;

% Create and solve problem
cvx_begin
   
   variable P(n)
   dual variable y
   dual variable l
   log_sum=0;
    for i=1:n
    log_sum= log_sum + log(1/h(i,1)+P(i,1));
    end 
   minimize ( -log_sum )
   subject to
     l: P >= 0;
     y: (ones(n,1)'*P) == pb;
         
cvx_end

% KKT conditions
%Primal feasibility
    (ones(n,1)'*P)-pb == 0;
    -P <= 0;
    
%Dual feasibility
    l>=0;

%Complementary slackness

    l'*(-P) == 0;

%Stationarity
    
   Lagrangian_derivative = -(1./(P+(1./h)))-l-y;
    

% Display results
disp( 'Optimal vector:' );
disp( [ '   P     = [ ', sprintf( '%7.4f ', P ), ']' ] );

disp( 'Primal feasibility:' );
disp( [ '   pf_equality    = [ ', sprintf( '%7.4f ', (ones(n,1)'*P)-pb ), ']' ] );
disp( [ '   pf_inequality    = [ ', sprintf( '%7.4f ', -P <= 0 ), ']' ] );

disp( 'Dual feasibility:' );
disp( [ '   df    = [ ', sprintf( '%7.4f ', l>=0 ), ']' ] );

disp( 'Complementary slackness:' );
disp( [ '   cs    = [ ', sprintf( '%7.4f ', l'*(-P) ), ']' ] );

disp( 'Stationarity:' );
disp( [ '   st    = [ ', sprintf( '%7.4f ', Lagrangian_derivative  ), ']' ] );


f1 = figure(1);
clf(f1); 
subplot(2,1,1)
set(f1, 'Color', [1 1 1])
bar(P)
xlabel('Users')
ylabel('Power Allocated')
subplot(2,1,2)
set(f1, 'Color', [1 1 1])
bar(1./h)
xlabel('Users')
ylabel('1/h')









