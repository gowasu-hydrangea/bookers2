const { environment } = require('@rails/webpacker')

module.exports = environment

// Bootstrapを使うために必要な記述を追加する
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)