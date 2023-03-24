# scc-vscode-jupyterhub

Scripts for launching a VS Code server through JupyterHub.

## Organization

The user selects "VS Code Server" from the JupyterHub drop-down. The launcher calls `bin/vscode-custom`, which is a Python shim to start `code-runner.sh`. This script sets up the HTML landing page for the user, starts the server, and runs a thin HTTP server to present the page to the user.

The JupyterHub launcher config is in a different repo: https://github.com/flatironinstitute/scc-containers/blob/master/160/jupyterhub.yaml

`code` is the VS Code Standalone CLI, from https://code.visualstudio.com/#alt-downloads.

More info about VS Code Server on the wiki: https://wiki.flatironinstitute.org/SCC/Software/VSCode

## Useful commands
***REMOVED***

*The following pertain to the jupyter-dev test deployment. Replace `jupyter-dev` with `jupyter` to deploy to prod.*

***REMOVED***

***REMOVED***

***REMOVED***
