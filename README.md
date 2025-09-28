# A Dockerized Python Development Environment Template

This repository provides a template for a dockerized Python development environment with VScode and the Dev Containers extension. It uses [UV](https://docs.astral.sh/uv/) to set the Python virtual environment. This template includes the following features:
- Python 3.11
- Virtual environment 
- Dev Containers settings
- Quarto 
- Ruff settings
- Dockerfile
- UV
- zsh settings
- CLI tools 

See also:
- [A tutorial for setting this template](https://medium.com/@rami.krispin/setting-a-dockerized-python-development-environment-template-de2400c4812b)
- [From Zero to a Dockerized Development Environment in Minutes with GitHub Repository Templates](https://theaiops.substack.com/p/from-zero-to-a-dockerized-development)
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

Once you have the repository set locally, you can update and modify the image setting according to your requirements using the following steps:
- Update the required Python libraries under the `docker/requirements.txt` file.
- Update the image settings (e.g., label, versions, etc.) in the `docker/build_dev_docker.sh` file
- Execute the `docker/build_dev_docker.sh` file to build the project image
- Updated the image name in the `.devcontainer/devcontainer.json` file

## Image Settings

For efficiency reasons, the template image is split into two builds:
- [Base image](https://hub.docker.com/repository/docker/rkrispin/python-base/general) - the core dependencies (Quarto, Debian dependencies, CLI tools, etc.) 
- [Dev image](https://hub.docker.com/repository/docker/rkrispin/python-dev-template/general) - built on top of the base image, adding the Python virtual environment 
Generally, when starting a new project, you should only update and rebuild the Dev image. This reduces the image's build from a few minutes to a few seconds.

Both images are available for both `arm64` (Apple Silicon), and `amd64` (Intel) platforms.

The [build_base_docker.sh](https://github.com/RamiKrispin/vscode-python-uv-template/blob/main/docker/build_base_docker.sh) bash script triggers the build of the base image using the [Dockerfile_Base](https://github.com/RamiKrispin/vscode-python-uv-template/blob/main/docker/Dockerfile_Base) file. Likewise, the [build_dev_docker.sh](https://github.com/RamiKrispin/vscode-python-uv-template/blob/main/docker/build_dev_docker.sh) bash script triggers the build of the dev image using the [Dockerfile_Dev](https://github.com/RamiKrispin/vscode-python-uv-template/blob/main/docker/Dockerfile_Dev) file

## The Dev Containers Settings

The template was created to enable seamless customization and modification of the Python environment with the use of environment variables. That includes the Python version, the virtual environment name, installation libraries, setting environment variables, etc. The template can be used as a baseline for setting a dockerized Python environment or as a baseline for a more customized template using the `devcontainer.json` file:

`.devcontainer/devcontainer.json`

```json
{
    "name": "python-dev",
    "image": "docker.io/rkrispin/python-dev-template:0.0.1",
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
                "aaron-bond.better-comments",
                //Code
                "oderwat.indent-rainbow",
                // Data
                "mechatroner.rainbow-csv",
                "ms-toolsai.datawrangler",
                // Git
                "mhutchie.git-graph",
                // Misc
                "streetsidesoftware.code-spell-checker",
                // Code
                "continue.continue"

            ]
        }
    },
    // Optional, local zsh history:
    "mounts": [
        "source=${localEnv:HOME}/.zsh_history_dev,target=/root/.zsh_history,type=bind,consistency=cache"
    ],
    // Optional set environment variables:
    "remoteEnv": {
        "MY_VAR": "${localEnv:MY_VAR:test_var}"
    },
    // Optional load environment variables from a file:
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

## Features

This template contains the following CLI tools:
- [Zsh](https://www.zsh.org/) and [Oh-My-Zsh](https://ohmyz.sh/) setting
- Mount local zsh history
- Zsh syntax [highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Colorls](https://github.com/athityakumar/colorls)


TODO
- [fzf](https://github.com/junegunn/fzf)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [thefuck](https://github.com/nvbn/thefuck)


## Requirements

The `devcontainer.json` use the mount argument to mount the local zsh history file to the container during the run time using the following code chunk:

```json
   "mounts": [
        "source=${localEnv:HOME}/.zsh_history_dev,target=/root/.zsh_history,type=bind,consistency=cache"
    ]
```

Where the source and target arguments map the local `.zsh_history` file path to the one in the container. 

Note: to prevent the `.zsh_history` file from getting corrupted by writing simultaneously from both the container and locally, I created a copy of my local `.zsh_history` file and labeled it as `.zsh_history_dev`. 

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
