# Finances Calculator

A standalone desktop application for analyzing bank statements and calculating transaction totals.

## Features

- Load CSV bank statements
- Interactive table view with transaction data
- Select/deselect transactions by clicking
- Calculate totals for selected transactions
- Highlight selected rows in yellow
- No dependencies required (standalone executable)

## Development Setup

### Prerequisites
- Python 3.8+
- pip

### Installation
1. Clone the repository
2. Create virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```
3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Running the Application
```bash
python finances_auto_calc.py
```

### Building Standalone Executable
```bash
./build.sh
```

### Creating Deployment Package
```bash
./create_package.sh
```

## Deployment

The application can be deployed as a standalone executable that runs on any Linux machine without requiring Python or dependencies.

### Package Contents
- `finances_calculator` - Standalone executable
- `install.sh` - Installation script
- `finances_calculator.desktop` - Desktop integration
- `chappelle_money_icon.png` - Custom application icon
- `README.txt` - Installation instructions

### Installation on Target Machine
1. Extract the package: `tar -xzf finances_calculator_linux.tar.gz`
2. Navigate to package directory: `cd finances_calculator_package`
3. Install: `sudo ./install.sh`
4. Run: `finances_calculator` or find in applications menu

## File Structure

```
finances_calculator/
├── finances_auto_calc.py          # Main application source
├── build.sh                       # Build script for executable
├── create_package.sh              # Package creation script
├── install.sh                     # Installation script
├── requirements.txt               # Python dependencies
├── finances_calculator.desktop    # Desktop file
├── chappelle_money_icon.png       # Custom application icon
├── README.md                      # This file
└── venv/                          # Virtual environment (not in repo)
```

## Usage

1. Launch the application
2. Select a CSV file when prompted
3. The file should have an "Amount" column
4. Click on rows to select/deselect transactions
5. Selected rows are highlighted in yellow
6. Total is calculated and displayed at the bottom

## License

This project is for personal use.
