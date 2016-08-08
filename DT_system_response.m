%% System Model
b1 = 0;
b2 = 0.4673;
b3 = -0.3393;

a1 = 1;
a2 = -1.5327;
a3 = 0.6607;

num = [b1 b2 b3];
den = [a1 a2 a3];
Gp = tf(num,den,-1);

%% Input

N = 40; % Total time instants
k = 1:40; %Time vector

%Impulse

x = [ones(1,N)];


%% Controller

Gc = 1/z*Gp;

Gf = (Gc * Gp) / (1 + Gc*Gp);
Gf = minreal(Gf);
[numf, denf] = tfdata(Gf);
numf = double(numf);
denf = double(denf);
%% output
y = filter(numf,denf,x);
%% Plot
plot(k,y,'kp');
