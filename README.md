# Prob-SynDis-PGG

Code for "Evolutionary dynamics with probabilistic synergy and discounting in public goods game"

For evolutionary dynamics and figure plotting, we use MatlabR2020a. For Monte Carlo simulations of well-mixed populations and structured populations, we use Python 3.9.

# Contents

find_zero_***.m : Used to calculate the internal equilibrium point.

x_dot_well.m : Evolutionary dynamics in well-mixed populations. This code is used to generate Figure 2.

plot_r_delta_***.m : The equilibrium fraction of cooperators $x^{*}$ as a function of $r$ for different values of $\delta$. This code is used to generate Figure 3.

plot_simu_theo_***.m : Compares the simulation results with the theoretical results when $p \in [0,1]$ in the well-mixed populations and structured populations, respectively. This code is used to generate Figure 4.

plot_G_p**.m : The evolutionary dynamics for different group sizes $G$ (the group size of the well-mixed population) or $k+1$ (the group size of the structured population) when $p=0.3$ and $p=0.6$, respectively. This code is used to generate Figure 5.

plot_simu_time.m : Simulation results in well-mixed populations. The data used to generate the graph is simu_***.mat, and to save data space, we take 1*10^8 data at equal intervals as 1*10^4. This code is used to generate Figure S1.

plot_p_r_***.m : Phase diagrams of the $r$-$p$ parameter plane. The data used to generate the graph is data_p_r_***.mat. This code is used to generate Figure S2.

plot_p_G_***.m : Phase diagrams of the $G$-$p$ and $(k+1)$-$p$ parameter plane. The data used to generate the graph is data_p_G_***.mat. This code is used to generate Figure S3.

Simulation_***.py : Monte Carlo simulations with a single set of parameters. The resulting data were used to generate Figure 3 and Figure S1.
