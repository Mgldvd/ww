# ww cli

Command-launcher powered by **fzf** and YAML.
Loads every `*.yml` in the current directory, shows them in a grouped menu, and runs the selected command with optional placeholder substitution.

## Prerequisites

* bash
* fzf
* yq (https://github.com/mikefarah/yq)

## Install

```bash
git clone https://github.com/yourname/ww.git
cd ww
sudo ./install.sh
```

## Usage

Create any number of .yml files beside the ww script or in the working directory where you call it:

```yml
commands:
  - group: System
    name: list all
    command: ls -la
    description: List directory contents

  - group: Packages
    name: install
    command: sudo apt install {{package_name}} -y
    description: Install package
```

## Run:

```bash
ww
```

Select a command, fill in prompted placeholders, and it executes.
Updating commands

Just edit or add new .yml files; the next ww run picks them up automatically.
Uninstall

```bash
sudo rm -f /usr/local/bin/ww
sudo rm -rf /usr/local/share/ww
```

## License

MIT
