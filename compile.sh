#!/bin/bash

# Define the main file name (without extension)
MAIN_FILE="main"

# Create versions directory if it doesn't exist
if [ ! -d "versions" ]; then
    mkdir versions
    echo "Created versions directory."
fi

echo "Compiling..."

# Compilation sequence to ensure references and citations are correct
pdflatex "${MAIN_FILE}.tex"
bibtex "${MAIN_FILE}"
pdflatex "${MAIN_FILE}.tex"
pdflatex "${MAIN_FILE}.tex"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."
else
    echo "Compilation failed."
    exit 1
fi
