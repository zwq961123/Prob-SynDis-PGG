clear all

r = 5;
k_values = linspace(1, 9, 1000);
p_values = linspace(0, 1, 1000);
delta = 0.4;
states = zeros(length(k_values), length(p_values));
fracs1 = zeros(length(k_values), length(p_values));
fracs2 = NaN(length(k_values), length(p_values));


for i = 1:length(k_values)
    for j = 1:length(p_values)
        [states(i, j), fracs1(i, j), fracs2(i, j)] = analyze_state(r, k_values(i), p_values(j), delta);
    end
end

figure
myColormap = [
    0.9 0.3 0.1
    0.79, 0, 0.1255; % Light red-- C
    0.25 0.45 0.73; % Dark blue-- D
    0.57,0.772,0.87; % Green-- bi-C+D
    0.32 0.79 0.49; % Light blue-- C+D
    0.94 0.55 0.25; % yellowish-brown -- bi-C+D C
]; 
imagesc(p_values, k_values, states)
colormap(myColormap);

axis xy 

yticks_current = get(gca, 'ytick');
if length(yticks_current) == 9
    yticklabels(2:10);
else
    disp('Unexpected number of yticks. Check your plot.');
end

hold on;
contour_levels = [0.5, 1.5, 2.5, 3.5]; 
contour(p_values, k_values, states, contour_levels, 'LineColor', 'k', 'LineWidth', 1, 'ShowText', 'off');
hold off;
xlabel('${p}$','Interpreter','latex', 'FontSize', 12);
ylabel('${r}$','Interpreter','latex', 'FontSize', 12);
set(gca, 'FontName', 'Arial'); 
set(gca, 'FontSize', 14);
box on;


function [state, frac1, frac2] = analyze_state(r, k, p, delta)
    phi1 = @(x, p, delta, k) (r / ((k + 1) * delta)) * (((k-2)*x+1)*((1 + delta) * (lam1(x, p, delta, k) - lam2(x, p, delta, k)) - (1 - delta) * (lam3(x, p, delta, k) - lam4(x, p, delta, k))) + (lam1(x, p, delta, k) - lam2(x, p, delta, k) - lam3(x, p, delta, k) + lam4(x, p, delta, k)) + delta * (k - 1) * (lam2(x, p, delta, k) + lam4(x, p, delta, k))) - (k + 1);
    phi2 = @(x, p, delta, k) (r / ((k + 1) * delta)) * (lam1(x, p, delta, k) - lam2(x, p, delta, k) - lam3(x, p, delta, k) + lam4(x, p, delta, k));
    phi3 = @(x, p, delta, k) (r / ((k + 1) * delta)) * ((k - 2) * x * (lam1(x, p, delta, k) - lam2(x, p, delta, k) - lam3(x, p, delta, k) + lam4(x, p, delta, k)) - delta * (k - 1) * (lam2(x, p, delta, k) + lam4(x, p, delta, k))) + k + 1;
    phi4 = @(x, p, delta, k) (r / ((k + 1) * delta)) * ((1 + delta) * (lam1(x, p, delta, k) - lam2(x, p, delta, k)) - (1 - delta) * (lam3(x, p, delta, k) - lam4(x, p, delta, k)));

    f = @(x, r, k, p, delta) x * (1 - x) * (phi1(x, p, delta, k) - phi2(x, p, delta, k) - phi3(x, p, delta, k) + phi4(x, p, delta, k) - (k - 2) * x * (phi2(x, p, delta, k) - phi4(x, p, delta, k)));

    x_values = linspace(0, 1, 1000);
    dx_values = arrayfun(@(x) f(x, r, k, p, delta), x_values);
    zeros = [];

    for i = 3:length(dx_values)-1
        if dx_values(i - 1) * dx_values(i) <= 0
            zeros = [zeros, i];
        end
    end
    
    frac2 = NaN; 
    
    if isempty(zeros)
        if dx_values(2) > 0 && dx_values(end-1) > 0
            state = 0;
            frac1 = 1;
        elseif dx_values(2) < 0 && dx_values(end-1) < 0
            state = 1;
            frac1 = 0;
        else
            state = -1;
            frac1 = NaN;
        end
    elseif length(zeros) == 1
        if dx_values(zeros(1) - 1) > 0 && dx_values(zeros(1) + 1) < 0
            state = 2;
        elseif dx_values(zeros(1) - 1) < 0 && dx_values(zeros(1) + 1) > 0
            state = 3;
        else
            state = -1;
        end
        frac1 = x_values(zeros(1));
    elseif length(zeros) == 2
        state = 4;
        frac1 = x_values(zeros(2));
        frac2 = x_values(zeros(1));
    else
        state = -1;
        frac1 = NaN;
    end
end

function lam1 = lam1(x, p, delta, k)
    lam1 = p * (1 + delta) * (1 + (((k - 2) * x + 1) / (k - 1)) * delta)^(k - 1);
end

function lam2 = lam2(x, p, delta, k)
    lam2 = p * (1 + (((k - 2) * x) / (k - 1)) * delta)^(k - 1);
end

function lam3 = lam3(x, p, delta, k)
    lam3 = (1 - p) * (1 - delta) * (1 - (((k - 2) * x + 1) / (k - 1)) * delta)^(k - 1);
end

function lam4 = lam4(x, p, delta, k)
    lam4 = (1 - p) * (1 - (((k - 2) * x) / (k - 1)) * delta)^(k - 1);
end
