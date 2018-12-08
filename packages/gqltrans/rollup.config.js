import resolve from 'rollup-plugin-node-resolve';
import commonjs from 'rollup-plugin-commonjs';

module.exports = {
  input: 'src/index.bs.js',
  output: {
    file: 'dist/bundle.js',
    format: 'cjs',
    exports: 'named'
  },
  external: ['graphql'],
  plugins: [
    resolve(),
    commonjs()
  ]
}