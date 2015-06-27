# name: top posters
# about: Plugin for Discourse showing users ranked by number of posts over week
# version: 0.1
# authors: Alexey Glukhov (pineapplethief)
# url: insert url later

enabled_site_setting :zr_integration_enabled

register_asset 'stylesheets/common/zr_integration.scss'
register_asset 'stylesheets/desktop/zr_integration.scss', :desktop
register_asset 'stylesheets/mobile/zr_integration.scss', :mobile

#register_asset 'javascripts/discourse/templates/discovery.hbs', :server_side
#register_asset 'javascripts/discourse/templates/components/top-posters.hbs', :server_side

PLUGIN_NAME ||= "zr_integration".freeze

after_initialize do

  module ::ZrIntegration
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace ZrIntegration
    end
  end


  #require_dependency 'basic_user_serializer'
  #class DiscourseTopPosters::TopPosterUserSerializer < BasicUserSerializer
  #  attributes :posts_count
  #end

  #require_dependency 'application_controller'


  Discourse::Application.routes.append do
    mount ::ZrIntegration::Engine, at: '/zr_integration'
  end

end