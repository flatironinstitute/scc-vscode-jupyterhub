# scc-vscode-jupyterhub

Scripts for launching a VS Code server through JupyterHub.

## Organization

The user selects "VS Code Server" from the JupyterHub drop-down. The launcher calls `bin/vscode-custom`, which is a Python shim to start `code-runner.sh`. This script sets up the HTML landing page for the user, starts the server, and runs a thin HTTP server to present the page to the user.

The JupyterHub launcher config is in a different repo: https://github.com/flatironinstitute/scc-containers/blob/master/160/jupyterhub.yaml

`code` is the VS Code Standalone CLI, from https://code.visualstudio.com/#alt-downloads.

More info about VS Code Server on the wiki: https://wiki.flatironinstitute.org/SCC/Software/VSCode

## Useful commands
To update the CLI: `./bin/code update`

***REMOVED***

***REMOVED***

***REMOVED***

***REMOVED***

## License
Copyright 2025 Simons Foundation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
