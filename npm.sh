#!/bin/bash
# deprecated

packages=(
# Npm utilies
npm
np
npx
npkill
npm-check
npm-check-updates
npm-name-cli
parcel-bundler

# General utilities
fkill-cli
now
spoof
svg-term-cli
tldr
vtop

# Other utilities
depcheck
diff-so-fancy
heroku
madge
meta
typescript
yalc
yarn

# CSS
stylelint
stylelint-config-standard

# Testing
#gemini
#html-reporter
#selenium-standalone
)


for package in "${packages[@]}"
do
  echo "Installing ${package}..."
  npm i -g "${package}"
done
#selenium-standalone install


