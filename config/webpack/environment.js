const { environment } = require("@rails/webpacker");
const webpack = require("webpack");
const erb = require("./loaders/erb");

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jquery: "jquery",
    Popper: ["popper.js", "default"],
  })
);

environment.loaders.prepend("erb", erb);
// 解决第三方库样式文件相对路径问题
environment.loaders.get("sass").use.splice(-1, 0, {
  loader: "resolve-url-loader",
});
module.exports = environment;
