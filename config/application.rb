require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AppCurriculo
  class Application < Rails::Application
    
    config.i18n.default_locale = 'pt-BR'
    config.i18n.available_locales = 'pt-BR'
    # configurar armazenamento paper clip
    # config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: "Local", local_root: "#{Rails.root}/public"}, fog_directory: "", fog_host: "localhost"}

  end
end
