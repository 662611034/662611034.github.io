#!/usr/bin/zsh
zola build
rm -rf ../zola-gh-pages/*
cp -r public/* ../zola-gh-pages/
cd ../zola-gh-pages
git add .
git commit -m "Deploy `date +%Y-%m-%d`"
git push origin gh-pages
