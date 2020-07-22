const path = require('path');
const {CleanWebpackPlugin} = require('clean-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const TerserPlugin = require('terser-webpack-plugin');
const OptimizeCssAssetsPlugin =  require('optimize-css-assets-webpack-plugin');


module.exports = {
    entry: ["babel-polyfill","./src/index.jsx"],
    output: {
        filename: "[name].bundle.js",
        path: path.resolve(__dirname, 'dist')
    },
    devtool: "source-map",
    optimization:{
        splitChunks: {
            chunks: "all",
        },
        minimizer: [
            new OptimizeCssAssetsPlugin(),
            new TerserPlugin()
        ]
    },
    plugins: [

        new CleanWebpackPlugin(),
        new MiniCssExtractPlugin({
            filename:"[name].bundle.css",
        }),

    ],
    module: {
        rules: [
            {
                test: /\.jsx$/,
                exclude: /node_modules/,
                loader: {
                    loader: "babel-loader",
                    options: {
                        presets:[
                            "@babel/preset-env", "@babel/preset-react"
                        ]
                    }
                }

            },
            {
                test: /\.js$/,
                exclude: /node_modules/,
                loader: {
                    loader: "babel-loader",
                    options: {
                        presets:[
                            "@babel/preset-env"
                        ]
                    }
                }

            },
            {
                test: /\.css$/,
                use: [MiniCssExtractPlugin.loader, 'css-loader']
            },
            {
                test: /\.scss$/,
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader']
            },
            {
                test: /\.(png|jpeg|gif|jpg)$/i,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            publicPath: 'dist',
                            name: '[name].[ext]',
                        },
                    },
                ],
            },
        ]
    }
}