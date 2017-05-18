%% Velocity profile plot
figure(1)
hold on

plot(u(2:end-1,end),zc(2:end-1))
grid on

%% semilogx plot
figure(2)
semilogx(y_plus_D(2:end),u(2:end,end));

plot(u(2:end-1,end),zc(2:end-1),'b');
xlabel('u(m/s)'); ylabel('z(m)');
grid on
%ANALYTIC SOLUTION
u_analytic = -6*Q/H^3*(zc.^2-H*zc)*(prescribeswitch == 1)*(bcswitch == 0)*(uwall1 == 0) + ...
             1./(2.*mu).*mean(dpdx).*(zc.^2-H*zc).*(prescribeswitch == 0).*(bcswitch == 0).*(uwall1 == 0) + ...
             1./(2.*mu).*mean(dpdx).*zc.^2+(dudzwall-1./mu .* mean(dpdx).*H).*zc.*(bcswitch == 1).*(prescribeswitch == 0); %poiseuille flow, i.e. v = 0 at walls, if Q is specified
if show_analytic==1
plot(u_analytic(2:end-1),zc(2:end-1),'r'); legend('numerical','analytic');

end
figure(3)
hold on
plot(u(2:end-1,end)/max(u(:,end)),zc(2:end-1),'b')
plot(u_analytic(2:end-1)/max(u_analytic(:,end)),zc(2:end-1),'r')
legend('numerical','analytic')
xlabel('u/u_{max}'); ylabel('z(m)')
grid on

% %%
figure(4)
semilogx(zc(2:end-1),u(2:end-1,end),'b');
%%
figure(5)
hold on
title('Numerical vs Analytical solution' )
plot(u(2:end-1,end)/max(u(2:end-1,end)),zc(2:end-1),'ob')
plot(u_analytic(2:end-1)/max(u_analytic(2:end-1)),zc(2:end-1),'r')
legend('Numerical','Analytic')
xlabel('u/u_{max}'); ylabel('z(m)')
grid on
%%
figure(6)
plot(zf(2:end-1),nu_t,'o')

