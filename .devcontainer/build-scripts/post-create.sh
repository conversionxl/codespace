git clone https://github.com/conversionxl/cxl-wpstarter.git
rm -rf .git
mv cxl-wpstarter/.git .
git reset --hard
git clean -fxd
git checkout codespaces