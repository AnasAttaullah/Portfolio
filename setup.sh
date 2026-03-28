#!/bin/bash
# Dev Portfolio - Automated Setup Script
# Run this AFTER installing Node.js, Hugo, and Go

set -e  # Exit on error

echo "========================================="
echo "Dev Portfolio - Setup Script"
echo "========================================="
echo ""

# Check prerequisites
echo "Checking prerequisites..."
echo -n "Node.js: "
if ! command -v node &> /dev/null; then
    echo "❌ NOT FOUND"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi
node --version

echo -n "npm: "
if ! command -v npm &> /dev/null; then
    echo "❌ NOT FOUND"
    exit 1
fi
npm --version

echo -n "Hugo: "
if ! command -v hugo &> /dev/null; then
    echo "❌ NOT FOUND"
    echo "Please install Hugo from https://gohugo.io/installation/"
    exit 1
fi
hugo version

echo -n "Go: "
if ! command -v go &> /dev/null; then
    echo "❌ NOT FOUND"
    echo "Please install Go from https://golang.org/dl/"
    exit 1
fi
go version

echo ""
echo "✅ All prerequisites found!"
echo ""

# Clean up old installation (if any)
echo "Cleaning up old installations..."
rm -rf node_modules package-lock.json
rm -rf go.sum
echo "✅ Cleanup complete"
echo ""

# Install dependencies
echo "Installing Node.js dependencies..."
npm install
echo "✅ Dependencies installed"
echo ""

# Download Hugo modules
echo "Downloading Hugo modules..."
hugo mod clean --all
hugo mod get -u ./...
hugo mod tidy
echo "✅ Hugo modules downloaded"
echo ""

# Verify installation
echo "Verifying installation..."
npm run build
echo ""
echo "========================================="
echo "✅ Setup Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "1. Start development: npm run dev"
echo "2. Open browser to:   http://localhost:1313"
echo ""
echo "For more info, see SETUP.md"
