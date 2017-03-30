# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
#   Rails.application.config.assets.precompile += ['active_admin.css', 'active_admin.js']
#   Rails.application.config.assets.precompile += [/^[a-z0-9]\w+\.(css|js)$/]
#   Rails.application.config.assets.precompile += ['*.js', '**/*.js']

 Rails.application.config.assets.precompile += %w(*.js ) # *.png *.jpg *.ico
 # Replace %w( *.css *.js *.css.scss) with complex regexp avoiding SCSS partials compilation
 Rails.application.config.assets.precompile += [/^[^_]\w+\.(css|css.scss)$/]
 #Adding active_admin JS and CSS to the precompilation list
 Rails.application.config.assets.precompile += %w( active_admin.css active_admin.js active_admin/print.css )
