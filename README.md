# Prob-SynDis-PGG

**Code for "Evolutionary dynamics with probabilistic synergy and discounting in public goods game"**

This repository includes code for performing evolutionary dynamics analysis and plotting figures. We use **MatlabR2020a** for evolutionary dynamics and figure plotting, and **Python 3.9** for Monte Carlo simulations of well-mixed and structured populations.

## Contents

- **find_zero_xxx.m**:  
  Used to calculate the internal equilibrium point.

- **x_dot_well.m**:  
  Handles evolutionary dynamics in well-mixed populations. This script generates **Figure 2**.

- **plot_r_delta_xxx.m**:  
  Plots the equilibrium fraction of cooperators \(x^*\) as a function of \(r\) for different values of \(\delta\). Generates **Figure 3**.

- **plot_simu_theo_xxx.m**:  
  Compares simulation results with theoretical results when \(p \in [0,1]\) in both well-mixed and structured populations. This script is responsible for **Figure 4**.

- **plot_G_pxxx.m**:  
  Discusses evolutionary dynamics for different group sizes \(G\) (for well-mixed populations) or \(k+1\) (for structured populations) when \(p=0.3\) and \(p=0.6\). Generates **Figure 5**.

- **plot_simu_time.m**:  
  Shows simulation results in well-mixed populations using a subset of data from `simu_xxx.mat`. To save data space, \(1 \times 10^8\) data points are reduced to \(1 \times 10^4\) intervals. This code produces **Figure S1**.

- **plot_p_r_xxx.m**:  
  Generates phase diagrams of the \(r-p\) parameter plane using data from `data_p_r_xxx.mat`. This script creates **Figure S2**.

- **plot_p_G_xxx.m**:  
  Produces phase diagrams of the \(G-p\) and \((k+1)-p\) parameter plane with data from `data_p_G_xxx.mat`. This code is used for **Figure S3**.

- **Simulation_xxx.py**:  
  Conducts Monte Carlo simulations with a single set of parameters. The output data are used to generate **Figure 3** and **Figure S1**.
