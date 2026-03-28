# Dev Portfolio - Setup Guide

This is a Hugo static site generator project with Tailwind CSS styling, built with Node.js tooling. Follow these steps to set up on a new machine.

## Required Software

Before starting, ensure you have the following installed:

1. **Hugo** (v0.130+)
   - Download: https://gohugo.io/installation/
   - Verify: `hugo version`

2. **Go** (1.20+)
   - Download: https://golang.org/dl/
   - Verify: `go version`
   - Required for Hugo modules

3. **Node.js** (18+) and npm/yarn
   - Download: https://nodejs.org/
   - Verify: `node --version` and `npm --version`

4. **Git**
   - Download: https://git-scm.com/
   - Verify: `git --version`

## Installation Steps

### Step 1: Install Required Software
**This is required on a new machine!**

#### Windows:
1. Download and install [Node.js LTS](https://nodejs.org/) (18+)
2. Download and install [Hugo](https://gohugo.io/installation/) (0.130+)
3. Download and install [Go](https://golang.org/dl/) (1.20+)
4. Download and install [Git](https://git-scm.com/)

After installation, restart your terminal/shell to ensure PATH is updated.

#### macOS (using Homebrew):
```bash
brew install node hugo go git
```

#### Linux:
```bash
# Ubuntu/Debian
sudo apt-get install nodejs npm hugo golang-go git

# Or use the official installers from the websites above
```

### Step 2: Clone the Repository
```bash
git clone <repository-url>
cd Portfolio
```

### Step 3: Run the Automated Setup

**On Windows:**
- Double-click `setup.bat` in the project folder
- Or from terminal: `setup.bat`

**On macOS/Linux:**
```bash
chmod +x setup.sh
./setup.sh
```

The setup script will automatically:
- Verify all prerequisites are installed
- Clean old installations
- Install Node.js dependencies using npm
- Download Hugo modules
- Build the site to verify everything works

### Step 4: Manual Setup (if scripts don't work)

If the automated setup fails:

```bash
# Install Node.js dependencies
npm install

# Download Hugo modules
hugo mod clean --all
hugo mod get -u ./...
hugo mod tidy

# Test the build
npm run build
```

## Development

### Start Development Server
```bash
npm run dev
# or
yarn dev
```
This starts Hugo in development mode with live reloading at `http://localhost:1313`

### Build for Production
```bash
npm run build
# or
yarn build
```
Output will be in the `public/` directory.

### Preview Production Build
```bash
npm run preview
# or
yarn preview
```

## Available NPM Scripts

| Script | Purpose |
|--------|---------|
| `npm run dev` | Start development server with live reload |
| `npm run build` | Build optimized production site |
| `npm run preview` | Preview production build locally |
| `npm run format` | Format code with Prettier |
| `npm run update-modules` | Update Hugo modules and packages |
| `npm run theme-setup` | Setup theme configuration |
| `npm run project-setup` | Setup project configuration |

## Common Tasks

### Add New Blog Post
1. Create a new file in `content/english/blog/` or the appropriate language directory
2. Follow the frontmatter format of existing posts
3. Run `npm run dev` to see changes

### Update Packages
To update Node.js dependencies:
```bash
npm update
# or specific packages
npm update tailwindcss prettier
```

To update Hugo modules:
```bash
npm run update-modules
```

### Format Code
```bash
npm run format
```

## Troubleshooting

### Hugo modules not found
```bash
rm -rf go.sum
hugo mod clean --all
hugo mod get -u ./...
```

### Node modules issues
```bash
rm -rf node_modules package-lock.json
npm install
```

### Port 1313 already in use
Hugo will automatically try the next available port, or specify:
```bash
hugo server --port 1314
```

## Project Structure

```
.
├── content/           # Blog posts and pages
├── data/              # Data files (YAML/JSON)
├── assets/            # CSS, JavaScript, images
├── config/            # Hugo configuration
├── layouts/           # Hugo templates
├── static/            # Static files (robots.txt, manifest, etc)
├── go.mod             # Hugo modules configuration
├── package.json       # Node.js dependencies
├── postcss.config.js  # PostCSS configuration
├── hugo.toml          # Hugo configuration file
└── README.md          # Project documentation
```

## Environment Variables

No environment variables are required for basic setup. For deployment, check `amplify.yml` and `netlify.toml`.

## Git Workflow

```bash
# Create a new branch
git checkout -b feature/my-feature

# Make changes and commit
git add .
git commit -m "Add my feature"

# Push to remote
git push origin feature/my-feature
```

## Additional Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Tailwind CSS](https://tailwindcss.com/docs)
- [Hugo Modules](https://gohugo.io/categories/modules/)

## Support

If you encounter issues:
1. Check the Hugo and Node.js versions match requirements
2. Run `hugo mod clean --all` && `npm install` fresh
3. Check the console output for specific error messages
