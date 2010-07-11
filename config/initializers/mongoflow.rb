app_name = "mongoflow"
APP_CONFIG = YAML::load(File.open("#{Rails.root}/config/#{app_name}.yml")).symbolize_keys
