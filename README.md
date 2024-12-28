# A Dockerized Python Development Environment Template

This repository provides a template for a dockerized Python development environment with VScode and the Dev Containers extension. It uses [UV](https://docs.astral.sh/uv/) to set the Python virtual environment. This template includes the following features:
- Python 3.11
- Virtual environment 
- Dev Containers settings
- Quarto 
- Ruff settings
- Dockerfile
- UV

See also:
- [A tutorial for setting this template](https://medium.com/@rami.krispin/setting-a-dockerized-python-development-environment-template-de2400c4812b)
- [Setting up a Python Development Environment with VScode and Docker](https://github.com/RamiKrispin/vscode-python)
- [Setting up an R Development  Environment with VScode and Docker](https://github.com/RamiKrispin/vscode-r)
- [Running Python/R with Docker vs. Virtual Environment](https://medium.com/@rami.krispin/running-python-r-with-docker-vs-virtual-environment-4a62ed36900f)


## General Requirements
To use this template out of the box, you will need on your local machine the following settings:
- VScode
- The Dev Containers extension
- Docker and Docker Desktop (or equivalent)
- Docker Hub account

A step-by-step guide for setting the above prerequisites is available here:
https://github.com/RamiKrispin/vscode-python/tree/main#prerequisites

## Clone the Template

It is straightforward to use this template and clone it to a different account. Click the `Use this template` green button on the top right and select the `Create a new repository` option. The steps from there are similar for creating a new repository on your account. At the end of this process, it generates a new repository with the template. 


## The Dev Containers Settings

The template was created to enable seamless customization and modification of the Python environment with the use of environment variables. That includes the Python version, the virtual environment name, installation libraries, setting environment variables, etc. The template can be used as a baseline for setting a dockerized Python environment or as a baseline for a more customized template using the `devcontainer.json` file:

`.devcontainer/devcontainer.json`

```json
{
    "name": "python-dev",
    "image": "docker.io/rkrispin/python-dev:arm64.0.0.1",
    "customizations": {
        "vscode": {
            "settings": {
                "python.defaultInterpreterPath": "/opt/python-3.11-dev/bin/python3",
                "python.selectInterpreter": "/opt/python-3.11-dev/bin/python3"
            },
            "extensions": [
                // Container
                "ms-azuretools.vscode-docker",
                "ms-vscode-remote.remote-containers",
                //Python
                "ms-python.python",
                "ms-python.vscode-pylance",
                "charliermarsh.ruff",
                // HTML
                "ms-vscode.live-server",
                // Documents/Settings
                "yzhang.markdown-all-in-one",
                "quarto.quarto",
                "redhat.vscode-yaml",
                "ms-toolsai.jupyter",
                "streetsidesoftware.code-spell-checker",
                "tamasfe.even-better-toml",
                //Code
                "oderwat.indent-rainbow",
                // Data
                "mechatroner.rainbow-csv",
                "ms-toolsai.datawrangler",
                // Git
                "mhutchie.git-graph",
                "mhutchie.git-graph",
                // Misc
                "streetsidesoftware.code-spell-checker"
            ]
        }
    },
    // Optional, mount local volume:
    // "mounts": [
    //     "source=${localEnv:DATA_FOLDER},target=/home/csv,type=bind,consistency=cache"
    // ],
    "remoteEnv": {
        "MY_VAR": "${localEnv:MY_VAR:test_var}"
    },
    "runArgs": [
        "--env-file",
        ".devcontainer/devcontainer.env"
    ]
}
```
 **Note:** The default docker settings are available under the [docker]() folder

The `devcontainer.json` main arguments:
- `name` - defines the project name
- `image` - defines the image name to use during the container run time
- `customizations` - enables the modification of the VScode setting for the container and isolates it from the default settings. In this case, using the following two sub-arguments:
    - `settings` - to set the Python extension default interpreter
    - `extensions` to define the list of extensions to install upon the launch of the container
- `mounts` - optional (commented), enables to mount additional folders from the local file system in addition to the project root folder
- `remoteEnv` - set environment variables for the environment
- `runArgs` - passes arguments to the container during the run time


## Customization

By default, this template is using  it uses this [image](https://hub.docker.com/repository/docker/rkrispin/python-dev/tags/arm64.0.0.1/sha256-8d157d1f3218c1f5f76889f739b7eacea5dfcf185e0860eefa016fac8474eacf), which was set as an example. The docker folder contains a Docker workflow template that enables you to set the following:
- Python version
- Required libraries
- Install Quarto and define version
- Define the image labels and tags

You can modify the Python, Ruff and Quarto versions, virtual environment name, and the image tags by modify the `python_ver`, `ruff_ver`, `quarto_ver`, `venv_name, `image_label`, and `image_tag` variables in the `build_docker.sh` bash script and run:
``` shell
bash build_docker.sh
```

To modify the installed libraries, update the `requirements.txt` file.


## License

This template is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/) License.
