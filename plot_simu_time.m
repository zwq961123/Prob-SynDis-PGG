
%load pc

T = 100000000;
time = linspace(1, T, 10000)';

figure
semilogx(time, pc(:, 1), 'b');
hold on;
semilogx(time, pc(:, 2), 'r');
hold on;
semilogx(time, pc(:, 3), 'r');
hold on;
semilogx(time, pc(:, 4), 'r');
hold on;
semilogx(time, pc(:, 5), 'r');
hold on;
semilogx(time, pc(:, 6), 'r');
hold on;
semilogx(time, pc(:, 7), 'r');
hold on;
semilogx(time, pc(:, 8), 'r');
hold on;
semilogx(time, pc(:, 9), 'r');
hold on;
semilogx(time, pc(:, 10), 'r');

hold off


xlabel('MCS');
ylabel('Frequency of cooperators');
ylim([0 1]);


