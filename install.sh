#!/bin/bash

# Installation script for Finances Calculator
echo "Installing Finances Calculator..."

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script with sudo for system-wide installation"
    echo "Usage: sudo ./install.sh"
    exit 1
fi

# Get the actual user's home directory (not root's)
ACTUAL_USER_HOME=$(eval echo ~$SUDO_USER)

# Copy executable to /usr/local/bin
echo "Copying executable to /usr/local/bin..."
cp finances_calculator /usr/local/bin/
chmod +x /usr/local/bin/finances_calculator

# Install custom icon
echo "Installing custom icon..."
mkdir -p /usr/local/share/icons
cp chappelle_money_icon.png /usr/local/share/icons/

# Install desktop file
echo "Installing desktop file..."
cp finances_calculator.desktop /usr/share/applications/

# Create desktop shortcut for current user
echo "Creating desktop shortcut..."
# Try different possible desktop directory names
for DESKTOP_DIR in "$ACTUAL_USER_HOME/Desktop" "$ACTUAL_USER_HOME/desktop" "$ACTUAL_USER_HOME/Рабочий стол" "$ACTUAL_USER_HOME/桌面"; do
    if [ -d "$DESKTOP_DIR" ]; then
        cp finances_calculator.desktop "$DESKTOP_DIR/"
        chmod +x "$DESKTOP_DIR/finances_calculator.desktop"
        echo "Desktop shortcut created on $DESKTOP_DIR"
        break
    fi
done

echo "Installation complete!"
echo "You can now run 'finances_calculator' from anywhere, or find it in your applications menu."
echo "A desktop shortcut has also been created for easy access."
