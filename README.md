# scc-vscode-jupyterhub

Helper scripts for JupyterHub admins to add a VS Code [Remote Tunnel](https://code.visualstudio.com/docs/remote/tunnels) option.

## Overview

These scripts facilitate launching a VS Code Remote Tunnel server via a JupyterHub web interface. This can be a convenient way for users to run VS Code on a cluster node, especially for interactive tasks like running notebooks.

Here's how it works. The user selects "VS Code Server" from the drop-down on the JupyterHub website. JupyterHub launches `bin/vscode-custom`, which is a Python shim to start the `code-runner.sh` shell script. The shell script sets up an HTML landing page for the user, starts the server, and runs a thin HTTP server to present the page to the user. The page shows the server output to the user, thus allowing them to authentiate via GitHub or Microsoft (or whatever else the VS Code CLI supports). 

Logs go to users' `$HOME/.vscodehub` directory.

## Setup
JupyterHub must be set up with an option to launch the `bin/vscode-custom` script. At FI, this is done with a semi-custom modification of the JupyterHub `config.py`, providing a drop-down to users. The details will probably vary from site to site. Regardless, one just has to provide an option to call the `vscode-custom` script.

This script expects the environment variable `VSCODEHUB_RUNTIME_DIR` to be set. At FI, we set this to `/dev/shm/$SLURM_JOB_ID`. We set this in JupyterHub rather than the vscodehub scripts, since we additionally wrap `vscode-custom` in a `noslurm` shim that strips any `SLURM_*` variables from the environment. This is so that users can invoke `salloc`, `srun`, `sbatch`, etc, from within a VS Code server without the usual pitfalls of nested Slurm invocations. This may or may not be desired at all sites.

The `code` VS Code Standalone CLI must be downloaded and made available to `code-runner.sh`, in the location `bin/code` by default. For example: `wget 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' -O bin/code`. See the VS Code [download](https://code.visualstudio.com/download) page for other options.

There are a few site-specific references to "FI" and "rusty" in these scripts, but it should be easy to adapt these to any environment.

## License
Apache License, Version 2.0

Copyright 2025 Simons Foundation
