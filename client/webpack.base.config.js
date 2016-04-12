var path = require('path');
const webpack = require('webpack');
var postcss = require('postcss');
var autoprefixer = require('autoprefixer');
var precss = require('precss');
var lost = require('lost');
var rucksack = require('rucksack-css');
var ExtractTextPlugin = require("extract-text-webpack-plugin");

module.exports = {

    context: __dirname + '/client',
    entry: './js/route.js',
    output: {
        path: __dirname + "/app/assets/javascripts",
        publicPath: '/assets/',
        filename: '[name].js',
    },

    devtool: "cheap-inline-module-source-map",

    module: {
        loaders: [{
                test: /\.js$/m,
                exclude: /node_modules/,
                loader: 'babel?presets[]=es2015'
            }, {
                test: /\.css$/,
                loader: ExtractTextPlugin.extract('style-loader', 'css-loader!postcss-loader')
            }, {
                test: /\.(png|jpg|gif|svg)$/,
                loader: 'file?name=[name].[ext]'

            },

            {
                test: /jquery\.js$/,

                loader: 'imports?jQuery=jquery,$=jquery,this=>window'
            }, {
                test: require.resolve("jquery"),

                loader: "expose?$!expose?jQuery"
            },

        ]
    },

    postcss: function() {
        return [autoprefixer, precss, lost, rucksack];
    },

    plugins: [
        new ExtractTextPlugin('../stylesheets/[name].css'),
        new webpack.ProvidePlugin({
            $: "jquery",
            jQuery: "jquery",
            "windows.jQuery": "jquery",
            classie: 'desandro-classie',
        }),
        // new webpack.optimize.UglifyJsPlugin({
        //     compress: {
        //         warnings: false,
        //     }
        // })

    ],
    resolve: {

        modulesDirectories: ['web_modules', 'node_modules'],
        extensions: ['', '.js', 'css'],
    }


}
