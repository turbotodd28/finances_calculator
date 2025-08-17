#!/bin/bash

# Create deployment package
echo "Creating deployment package..."

# Create package directory
mkdir -p finances_calculator_package

# Copy executable
cp dist/finances_calculator finances_calculator_package/

# Copy installation files
cp install.sh finances_calculator_package/
cp finances_calculator.desktop finances_calculator_package/
cp chappelle_money_icon.png finances_calculator_package/

# Create README
cat > finances_calculator_package/README.txt << 'EOF'
Finances Calculator - Standalone Application

This package contains a standalone executable that can run on any Linux machine
without requiring Python or any dependencies to be installed.

INSTALLATION:
1. Extract this package to any location
2. Run: sudo ./install.sh
3. The application will be available system-wide with custom icon
4. A desktop shortcut will be created for easy access

USAGE:
- Run from terminal: finances_calculator
- Or find "Finances Calculator" in your applications menu
- Or double-click the desktop shortcut

FEATURES:
- Load CSV bank statements
- Calculate totals for selected transactions
- Highlight selected rows
- No dependencies required
- Custom money-themed icon
- Desktop shortcut for easy launching

The executable is completely self-contained and includes Python and all required libraries.
EOF

# Create tar.gz package
tar -czf finances_calculator_linux.tar.gz finances_calculator_package/

echo "Package created: finances_calculator_linux.tar.gz"
echo "You can copy this file to any Linux machine and extract it to install."
