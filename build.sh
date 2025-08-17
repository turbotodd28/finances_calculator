#!/bin/bash

# Build script for finances calculator
echo "Building standalone executable..."

# Clean previous builds
rm -rf build dist

# Build the executable
pyinstaller --onefile --windowed --name finances_calculator finances_auto_calc.py

echo "Build complete! Executable is in dist/finances_calculator"
echo "You can copy dist/finances_calculator to any Linux machine and run it."
