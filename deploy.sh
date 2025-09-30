#!/bin/bash

# Quick deployment script for Web3 RPC Sender

echo "🚀 Web3 RPC Sender - Quick Deploy Script"
echo "=========================================="
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit: Web3 RPC Sender"
    echo "✅ Git initialized!"
    echo ""
fi

echo "Choose your deployment method:"
echo "1) GitHub Pages (Static, Free, Easiest)"
echo "2) Vercel (Serverless, Free, Recommended)"
echo "3) Netlify (Static, Free)"
echo "4) Railway (Node.js, $5 free/month)"
echo ""
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo ""
        echo "📘 GitHub Pages Setup:"
        echo "1. Create a new repo at https://github.com/new"
        echo "2. Run these commands:"
        echo ""
        echo "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
        echo "   git branch -M main"
        echo "   git push -u origin main"
        echo ""
        echo "3. Go to repo Settings → Pages"
        echo "4. Select 'gh-pages' branch"
        echo "5. Your site will be at: https://YOUR_USERNAME.github.io/REPO_NAME/"
        ;;
    2)
        echo ""
        echo "🔺 Vercel Deployment:"
        if ! command -v vercel &> /dev/null; then
            echo "Installing Vercel CLI..."
            npm install -g vercel
        fi
        echo "Running vercel deploy..."
        vercel
        ;;
    3)
        echo ""
        echo "🎨 Netlify Deployment:"
        if ! command -v netlify &> /dev/null; then
            echo "Installing Netlify CLI..."
            npm install -g netlify-cli
        fi
        echo "Running netlify deploy..."
        netlify deploy
        ;;
    4)
        echo ""
        echo "🚂 Railway Setup:"
        echo "1. Push your code to GitHub (if not done yet)"
        echo "2. Go to https://railway.app"
        echo "3. Click 'Start a New Project'"
        echo "4. Select 'Deploy from GitHub repo'"
        echo "5. Choose your repository"
        echo "6. Click 'Deploy'"
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "✨ Deployment initiated!"
echo ""
echo "📖 For detailed instructions, see DEPLOYMENT.md"
