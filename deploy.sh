#!/usr/bin/zsh
set -e  # エラー時に止まるように

zola build

TARGET_DIR=../zola-gh-pages

# .gitを除いて削除
find "$TARGET_DIR" -mindepth 1 -maxdepth 1 \
  ! -name '.git' \
  ! -name '.gitignore' \
  -exec rm -rf {} +

# public の中身をコピー
cp -r public/* $TARGET_DIR/

cd $TARGET_DIR
git add .
git commit -m "Deploy $(date +%Y-%m-%d)"
git push origin gh-pages
