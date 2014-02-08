CompassAeSaas::Config.configure do |config|
  config.master_url = 'https://master.mycompassagile.com'
  config.compass_ae_security_token = 'bd7b19c0-a92d-11e2-9e96-0800200c9a66'
  config.validate_instances = true
end

CompassAeSaas::Config.configure!