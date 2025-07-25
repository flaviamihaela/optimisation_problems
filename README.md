# Optimisation Problems in MATLAB

## Overview

This repository contains a collection of MATLAB scripts that demonstrate the formulation and solution of various optimisation problems using the [CVX](http://cvxr.com/cvx/) modeling framework. The problems covered include:

- **Equality-Constrained Norm Minimization**
- **Least Squares Minimization**
- **Quadratic Programming**
- **Water-Filling Problem**

Each script generates random problem data, formulates the optimisation problem, solves it using CVX, and displays the results, including optimal solutions and relevant optimality conditions.

## Key Features

- **Self-contained examples:** Each script is ready to run and generates its own random data for reproducibility.
- **CVX-based modeling:** All problems are formulated and solved using the CVX package for convex optimisation.
- **KKT conditions:** Scripts for quadratic programming and water-filling display Karush-Kuhn-Tucker (KKT) conditions for deeper insight.
- **Visualisation:** The water-filling script includes bar plots for power allocation and channel characteristics.

## Dependencies

- **MATLAB** (R2016b or later recommended)
- **CVX** (Download from [cvxr.com/cvx](http://cvxr.com/cvx/))
  - Install and set up CVX by following the instructions on the CVX website.

## Run and Build

1. **Install CVX:**
   - Download and extract CVX from [cvxr.com/cvx](http://cvxr.com/cvx/).
   - In MATLAB, run `cd` to the CVX directory and execute `cvx_setup`.

2. **Clone or download this repository.**

3. **Run a script:**
   - Open MATLAB.
   - Navigate to the repository folder.
   - Run any script, for example:
     ```matlab
     run('least_squares.m')
     ```
   - The script will display results in the MATLAB command window.

## Usage (Parameter Tuning)

- **equality_constr_norm_min.m**
  - `p`: Norm order (e.g., 1, 2, or `Inf`)
  - `n`, `m`, `q`: Problem dimensions

- **least_squares.m**
  - `n`, `m`: Problem dimensions

- **quadratic_programming.m**
  - `n`, `p`, `m`: Problem dimensions

- **water_filling_problem.m**
  - `n`: Number of users/channels
  - `pb`: Total power budget
