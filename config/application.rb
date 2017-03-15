require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
ENV['RAILS_ADMIN_THEME'] = 'rollincode'

module AppCurriculo
  class Application < Rails::Application
    
   
    
    config.active_record.index_nested_attribute_errors = true
    
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'America/Sao_Paulo' # altera o time zone para a aplicação
    config.active_record.default_timezone = :local # altera o ActiveRecord pra gravar os campos mágicos com o mesmo time zone da aplicação
   
   
   # Less
     config.less.paths << "#{Rails.root}/lib/less/protractor/stylesheets"
     config.less.compress = true
 
    # configurar armazenamento paperclip
    # config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: "Local", local_root: "#{Rails.root}/public"}, fog_directory: "", fog_host: "localhost"}

  end
end
