module ApplicationConfig
  $config = YAML::load(File.open("#{RAILS_ROOT}/config/settings.yml"))
end