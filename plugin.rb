# name: Zona Radical integration
# about: Plugin for Discourse for integrating with Zona Radical Rails app
# version: 0.1
# authors: Alexey Glukhov
# url: https://github.com/pineapplethief/zr-discourse-integration

enabled_site_setting :zr_integration_enabled

register_asset 'stylesheets/common/zr_integration.scss'
register_asset 'stylesheets/desktop/zr_integration.scss', :desktop
register_asset 'stylesheets/mobile/zr_integration.scss', :mobile

PLUGIN_NAME ||= "zr_integration".freeze

after_initialize do

  module ::ZrIntegration
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace ZrIntegration
    end
  end

  Discourse::Application.routes.append do
    mount ::ZrIntegration::Engine, at: '/zr_integration'
  end

end