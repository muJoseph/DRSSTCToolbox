<h1>Brief</h1>

MATLAB project consisting of scripts and Simulink models for assisting in the design of the <i>Emma Mk1 DRSSTC</i>.

<h1>Emma Mk1 DRSSTC Project Live Documentation</h1>

<strong>[Emma Mk1 DRSSTC](https://www.mujoseph.com/projects/emma-mk1-drsstc)</strong>


<h1>File Directory</h1>

```text
DRSSTCToolbox/
├── analysis/       # Misc. scripts for data analysis/plotting
├── drc/            # DRSSTC DRC scripts
├── helper/         # Misc. helper functions
├── hrtim_sim/      # HRTIM Simulink model
├── resources/
├── round63/        
├── spice/          # SPICE sim files (e.g, LTSPice schematics, etc.)
```

<h1>DRSSTC DRC Usage</h1>

1. Modify system parameters and constants: ```drc/user/drsstc_user_params.mlx```
2. Modify sytem constants: ```drc/user/drsstc_user_constants.mlx.mlx```

3. Run: ```drc/DRSSTC_DRC.mlx```

<h1>HRTIM Simulation Usage</h1>

1. Modify simulation parameters: ```hrtim_sim/HRTIM_simulink_var.mlx```
2. Run: ```hrtim_sim/HRTIM_sim_run.mlx```

Simulink model: ```hrtim_sim/HRTIM_main.slx```