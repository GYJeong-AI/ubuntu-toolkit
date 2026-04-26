#!/usr/bin/env bash
set -euo pipefail

APP_NAME="sysupdate"
INSTALL_DIR="$HOME/.local/bin"
INSTALL_PATH="$INSTALL_DIR/$APP_NAME"

GREEN="\033[32m"
YELLOW="\033[33m"
RED="\033[31m"
RESET="\033[0m"

section() {
  echo
  echo "================================"
  echo -e "${GREEN}$1${RESET}"
  echo "================================"
}

warn() {
  echo -e "${YELLOW}Warning:${RESET} $1"
}

error() {
  echo -e "${RED}Error:${RESET} $1"
}

detect_shell_rc() {
  local shell_name
  shell_name="$(basename "${SHELL:-bash}")"

  case "$shell_name" in
    zsh)
      echo "$HOME/.zshrc"
      ;;
    bash)
      echo "$HOME/.bashrc"
      ;;
    *)
      echo "$HOME/.bashrc"
      ;;
  esac
}

SHELL_RC="$(detect_shell_rc)"

section "Installing $APP_NAME"

if ! command -v apt >/dev/null 2>&1; then
  error "apt command not found. This tool supports Ubuntu/Debian-based Linux distributions only."
  exit 1
fi

mkdir -p "$INSTALL_DIR"

cat > "$INSTALL_PATH" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

section() {
  echo
  echo "================================"
  echo -e "${GREEN}$1${RESET}"
  echo "================================"
}

error() {
  echo -e "${RED}Error:${RESET} $1"
}

if ! command -v apt >/dev/null 2>&1; then
  error "apt command not found. Run this on an Ubuntu/Debian-based Linux distribution."
  exit 1
fi

section "Updating package lists..."
sudo apt update

section "Upgrading packages..."
sudo apt full-upgrade -y

section "Removing unused packages..."
sudo apt autoremove --purge -y

section "Cleaning package cache..."
sudo apt autoclean -y

section "System maintenance completed."
EOF

chmod +x "$INSTALL_PATH"

section "Checking PATH"

if echo "$PATH" | tr ':' '\n' | grep -qx "$INSTALL_DIR"; then
  echo -e "${GREEN}$INSTALL_DIR is already in PATH.${RESET}"
else
  warn "$INSTALL_DIR is not in PATH."

  if [ ! -f "$SHELL_RC" ]; then
    touch "$SHELL_RC"
  fi

  if grep -Fxq 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC"; then
    echo -e "${GREEN}PATH setting already exists in $SHELL_RC.${RESET}"
  else
    {
      echo
      echo '# Add local user binaries to PATH'
      echo 'export PATH="$HOME/.local/bin:$PATH"'
    } >> "$SHELL_RC"

    echo -e "${GREEN}Added $INSTALL_DIR to PATH in $SHELL_RC.${RESET}"
  fi

  export PATH="$INSTALL_DIR:$PATH"
fi

section "Installation completed"

echo "Installed command:"
echo "  $INSTALL_PATH"

echo
echo "Run:"
echo "  sysupdate"

echo
echo "If the command is not found, run:"
echo "  source $SHELL_RC"

echo
echo "Verify:"
echo "  command -v sysupdate"