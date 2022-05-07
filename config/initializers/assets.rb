# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.scss, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Bootstrap
# see https://dev.to/coorasse/rails-7-bootstrap-5-and-importmaps-without-nodejs-4g8
Rails.application.config.assets.precompile += %w( bootstrap.min.js popper.js )
