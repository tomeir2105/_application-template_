#!/usr/bin/env bash
######################################
# Created by : Meir
# Purpose : python packages install script
# Date : 7/3/25
# Version : 1
#set -x
set -o errexit
set -o pipefail
set -o nounset
#####################################

# Display help function
show_help() {
  echo "Usage: $0 [-e <project_folder>] [-h]"
  echo
  echo "Options:"
  echo "  -e    Specify the project folder"
  echo "  -h    Show this help message."
  echo
  echo "This script sets up a virtual environment, installs necessary Python packages, and configures your project."
  echo
}

# One-liner for parsing command-line options
while getopts "e:h" opt; do case $opt in
  e) project_folder="$OPTARG";; 
  h) show_help; exit 0;;
  \?) echo "Invalid option: -$OPTARG" >&2; show_help; exit 1;; 
esac; done

if [ -z "$project_folder" ]; then
  echo "Error: Project folder (-e) is required."
  show_help
  exit 1
fi

sudo apt update
exit_status=$?
if [ $exit_status -eq 0 ]; then
    echo "apt database updated successfully."
else
    echo "Error: apt update failed with exit status $exit_status."
    exit 1
fi

# Install python3-venv
if ! dpkg -l | grep -q python3-venv; then
    sudo apt install -y python3-venv
    if dpkg -l | grep -q python3-venv; then
        echo "python3-venv installed successfully."
    else
        echo "Failed to install python3-venv."
        exit 1
    fi
fi

# Install requested task packages
install_tool() {
  if ! command -v "$1" &> /dev/null; then
    echo "$1 is not installed. Installing it now..."
    sudo apt install -y "$1"
  else
    echo "$1 is already installed."
  fi
}

# Install Tools
install_tool "python3-pip"
install_tool "pipx"
install_tool "makeself"
install_tool "sqlite3"
install_tool "virtualbox"  # Change to your preferred virtualization tool (VMware/KVM)

# Create the project directory if it doesn't exist
if [ ! -d "$project_folder" ]; then
  mkdir "$project_folder"
  echo "Project directory '$project_folder' created."
fi

cd "$project_folder"
if [ ! -d "venv" ]; then
  python3 -m venv venv
  echo "Virtual environment created."
fi

# Create a requirements.txt
if [ ! -f requirements.txt ]; then
  echo "Creating requirements.txt file..."
  echo "flask" > requirements.txt
  echo "flask-sqlalchemy" >> requirements.txt
  echo "flask-admin" >> requirements.txt   # Replaced flask-alchemyview
  echo "bootstrap-flask" >> requirements.txt
  echo "quart" >> requirements.txt
  echo "db-sqlite3" >> requirements.txt
  echo "requirements.txt file created."
fi

# Activate virtual environment
source venv/bin/activate
pip3 install -r requirements.txt
echo "Python dependencies installed in folder $project_folder venv."
