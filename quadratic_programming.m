% Quadratic programming problem.
% This script constructs a random minimization quadratic programming 
% problem and solves it using CVX. 

% Reproductibility
rng(0)

% Generate data
n = 10; 
p = n/2; 
m = n/2;

A = randn(p,n);
b = randn(p,1);
h =  randn(m,1);
G = randn(m,n);

q = randn(n,1);
P = randn(n);
P = P'*P + 1e-8*eye(n); 


% Create and solve problem
cvx_begin
   
   variable x(n)
   dual variable y
   dual variable l
   minimize ( 0.5*quad_form(x,P) + q'*x )
   subject to
     y: A * x == b;
     l: G * x- h <= 0;
        
cvx_end

% KKT conditions
% Primal feasibility
    
    A*x-b == 0;
    G*x-h <= 0;
    
% Dual feasibility
    l>=0;
% Complementary slackness
    l'*(G*x-h) == 0;
%Stationarity
    Lagrangian_deriv= P*x+q+A'*y+G'*l;
    


% Display results
disp( 'Optimal vector:' );
disp( [ '   x     = [ ', sprintf( '%7.4f ', x ), ']' ] );

disp( 'Primal feasibility:' );
disp( [ '   pf_equality    = [ ', sprintf( '%7.4f ', A*x-b ), ']' ] );
disp( [ '   pf_inequality    = [ ', sprintf( '%7.4f ', h- G*x >= 0 ), ']' ] );

disp( 'Dual feasibility:' );
disp( [ '   df    = [ ', sprintf( '%7.4f ', l>=0 ), ']' ] );

disp( 'Complementary slackness:' );
disp( [ '   cs    = [ ', sprintf( '%7.4f ', l'*(G*x - h) ), ']' ] );

disp( 'Stationarity:' );
disp( [ '   st    = [ ', sprintf( '%7.4f ', Lagrangian_deriv  ), ']' ] );

