# sysupdate

<p align="right">
  <a href="./README.ko.md"><img src="https://img.shields.io/badge/한국어-555555?style=for-the-badge&label=Language&labelColor=1f2937" alt="한국어"></a><a href="./README.md"><img src="https://img.shields.io/badge/English-2f80ed?style=for-the-badge&label=%20&labelColor=1f2937" alt="English"></a>
</p>

A simple command installer for running Ubuntu/Debian system updates with a single command.

After installation, you can run:

```bash
sysupdate
```

## Features

`sysupdate` runs the following commands internally:

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove --purge -y
sudo apt autoclean -y
```

## Supported Systems

This tool is intended for Linux distributions that use `apt`.

Examples:

- Ubuntu
- Debian
- Linux Mint
- Pop!_OS
- Elementary OS

It does not support distributions that do not use `apt`, such as Fedora, Arch Linux, or openSUSE.

## Installation

Clone the repository:

```bash
git clone https://github.com/GYJeong-AI/ubuntu-toolkit.git
cd ubuntu-toolkit/sysupdate
```

Make the installer executable:

```bash
chmod +x ./install.sh
```

Run the installer:

```bash
./install.sh
```

After installation, run:

```bash
sysupdate
```

## One-line Installation

If you are already inside the `sysupdate` directory:

```bash
chmod +x ./install.sh && ./install.sh
```

## Installation Path

The command is installed to:

```bash
~/.local/bin/sysupdate
```

If `~/.local/bin` is not in your `PATH`, the installer automatically adds it to your shell configuration file.

Examples:

```bash
~/.bashrc
```

or:

```bash
~/.zshrc
```

The added line is:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Verify Installation

```bash
command -v sysupdate
```

If installed correctly, it should print something like:

```bash
/home/username/.local/bin/sysupdate
```

## Usage

```bash
sysupdate
```

## Uninstall

Remove the installed command:

```bash
rm ~/.local/bin/sysupdate
```

Optionally, remove the following line from `~/.bashrc` or `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Warning

This tool uses:

```bash
sudo apt full-upgrade -y
```

`full-upgrade` may remove existing packages when required to resolve package dependencies.

This is usually fine for personal desktop systems, but on production servers or critical development environments, review the changes before running it.

For more conservative upgrade behavior, open the installed command:

```bash
nano ~/.local/bin/sysupdate
```

Change this line:

```bash
sudo apt full-upgrade -y
```

to:

```bash
sudo apt upgrade -y
```

## License

MIT License