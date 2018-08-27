packages=(
# Npm utilies
npm
np
npx
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
diff-so-fancy
gulp-cli
heroku
meta
typescript
webpack
webpack-cli

# Vue
@vue/cli
@vue/cli-init

# Linting
eslint
babel-eslint
eslint-config-airbnb-base
eslint-plugin-import
eslint-plugin-vue

# CSS
stylelint
stylelint-config-standard

# Testing
gemini
html-reporter
selenium-standalone
)


for package in "${packages[@]}"
do
  echo "Installing ${package}..."
  npm i -g "${package}"
done
selenium-standalone install


