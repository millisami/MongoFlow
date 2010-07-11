app_name = "mongoflow"
APP_CONFIG = YAML::load(File.open("#{RAILS_ROOT}/config/#{app_name}.yml")).symbolize_keys