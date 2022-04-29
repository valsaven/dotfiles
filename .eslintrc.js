module.exports = {
  parserOptions: {
    parser: 'babel-eslint'
  },
  extends: [
    'airbnb-base',
    'plugin:vue/recommended'
  ],
  globals: {
    '_': true,
    'axios': true,
    'Vue': true,
    'Vuex': true,
  },
  rules: {
    'arrow-body-style': 'off',
    'consistent-return': 'off',
    'import/extensions': 'off',
    "import/no-extraneous-dependencies": "off",
    'import/no-unresolved': 'off',
    'max-len': 'off',
    'no-param-reassign': 'off',
    'no-plusplus': 'off',
    'no-underscore-dangle': 'off',
    'no-useless-escape': 'off',
    'radix': 'off'
  }
}

