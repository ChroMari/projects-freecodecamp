/*
  * [ ] - подключить eslint к сборке хорошо работающий и не ломающий мне ничего.
  * [ ] - разнести всё на одтельные файлы и части проект, чтобы всё не было в одну кучу.
  * [ ] - посмотреть, что ещё лучше всего добавить к сборке проекта для css и js.
 */

const path = require('path');
const fs = require('fs')
const webpack = require('webpack');
const PugLintPlugin = require('puglint-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const sass = require('sass');
const { CleanWebpackPlugin } = require('clean-webpack-plugin'); 
const CopyPlugin = require('copy-webpack-plugin');

const PATHS = path.join(__dirname, './src');
const PAGES_DIR = `${PATHS}/pages/`;
const PAGES = fs.readdirSync(PAGES_DIR).filter(fileName => fileName.endsWith('.pug'));

const devServer = (isDev) => !isDev ? {} : {
  devServer: {
    port: 4200,
    open: true,
    hot: true,
    // contentBase: path.join(__dirname, 'public'),
  }
};

module.exports = ({ develop }) => ({
  mode: develop ? 'development' : 'production',
  devtool: develop ? 'inline-source-map' : false,

  entry: {
    app: './src/pages/index.js',
  },

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].[contenthash].js',
    assetModuleFilename: 'assets/[hash][ext]',
  },

  module: {
    rules: [
      { 
        test: /\.js$/, 
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            cacheDirectory: true
          }
        }
      },

      {
        test: /\.pug$/,
        use: ['pug-loader'],
      },

      {
        test: /\.(?:ico|gif|png|jpg|jpeg|svg|webp)$/i, 
        type: 'asset/resource',
      },

      {
        test: /\.(woff(2)?|eot|ttf|otf|svg)$/i,
        type: 'asset/resource',
      },

      {
        test: /\.css$/i,
        use: [ MiniCssExtractPlugin.loader, 'css-loader']
      },
      {
        test: /\.s[ac]ss$/i,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']
      },
    ]
  },

  resolve: {
    extensions: ['.js',],
  },

  plugins: [
    new MiniCssExtractPlugin({
      filename: 'css/[name].css',
      ignoreOrder: true
    }),

    ...PAGES.map(page => {
      const name = path.basename(page).replace(path.extname(page), '');

      return new HtmlWebpackPlugin({
        template: `${PAGES_DIR}/${page}`,
        filename: `./${name}.html`,
        minify: false,
      })
    }),

    new CleanWebpackPlugin({ cleanStaleWebpackAssets: false }), 

    new CopyPlugin({
      patterns: [
        {from: './public'}
      ]
    }),

  ],

  ...devServer(develop),

});
