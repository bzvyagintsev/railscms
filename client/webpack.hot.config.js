const path = require('path');
const webpack = require('webpack');

const config = require('./webpack.base.config');

const hotRailsPort = process.env.HOT_RAILS_PORT || 3500;

config.entry.app.push(
    `webpack-dev-server/client?http://localhost:${hotRailsPort}`,
    'webpack/hot/only-dev-server'
);

// These are Rails specific
config.entry.vendor.push(
    'jquery-ujs',
    'bootstrap-loader'
);

config.output = {
    filename: '[name]-bundle.js',
    path: path.join(__dirname, 'public'),
    publicPath: `http://localhost:${hotRailsPort}/`,
};

config.plugins.push(
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin()
);

config.devtool = 'eval-source-map';

console.log('Webpack dev build for Rails'); // eslint-disable-line no-console

module.exports = config;
