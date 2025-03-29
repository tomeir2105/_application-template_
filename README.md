# Python Setup Script

This script automates the setup of a Python project environment by installing necessary tools, setting up a virtual environment, and installing Python dependencies. It is designed to work on systems with `apt` (e.g., Ubuntu).

## Features

- **Create a project folder** if one doesn't already exist.
- **Set up a virtual environment** with Python 3.
- **Install required tools** (e.g., `python3-pip`, `pipx`, `makeself`, `sqlite3`, `virtualbox`).
- **Generate a `requirements.txt`** file with common dependencies such as Flask, SQLAlchemy, and Quart.
- **Install Python dependencies** using the `requirements.txt` file.

## Prerequisites

Before running the script, ensure that your system has:

- Ubuntu or any Debian-based distribution.
- `sudo` privileges for installing packages.

## Installation

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/yourusername/your-repository.git
   cd your-repository
   ```

2. Make the script executable:

   ```bash
   chmod +x setup_project.sh
   ```

## Usage

To use the script, run the following command:

```bash
./setup_project.sh [-e <project_folder>] [-h]
```

### Options

- `-e <project_folder>`: Specify the project folder (default is `project`).
- `-h`: Show the help message with usage details.

### Example

To set up a project in a custom folder `my_project`, run:

```bash
./setup_project.sh -e my_project
```

This will:

- Install the required tools (`python3-venv`, `pip`, `pipx`, etc.).
- Create a `my_project` directory if it doesn't exist.
- Set up a Python virtual environment.
- Create a `requirements.txt` file with some basic Flask dependencies.
- Install the dependencies in the virtual environment.

## Script Flow

1. **Tool Installation**: The script checks and installs the following tools if they're missing:
   - `python3-venv`
   - `python3-pip`
   - `pipx`
   - `makeself`
   - `sqlite3`
   - `virtualbox` (or another virtualization tool of your choice).

2. **Project Folder**: If the specified project folder doesn't exist, it will be created.

3. **Virtual Environment**: If the project folder doesn't contain a virtual environment (`venv`), the script creates one.

4. **`requirements.txt`**: The script generates a `requirements.txt` with the following dependencies:
   - `flask`
   - `flask-sqlalchemy`
   - `flask-admin`
   - `bootstrap-flask`
   - `quart`
   - `db-sqlite3`

5. **Install Dependencies**: The script activates the virtual environment and installs the dependencies listed in the `requirements.txt` file.

## Troubleshooting

- If you encounter any issues with permissions, try running the script with `sudo`:

  ```bash
  sudo ./setup_project.sh -e my_project
  ```

- Ensure that the required tools are available in your system's package manager (APT).

## License

This project is free to use.
