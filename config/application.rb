require File.expand_path('../boot', __FILE__)

require 'mongoid/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
require 'rails/test_unit/railtie'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module MongoFlow
  class Application < Rails::Application
    config.generators do |g|
      g.orm :mongoid
      g.template_engine :haml
    end
  end
end
