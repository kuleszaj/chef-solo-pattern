log_level                :info
log_location             STDOUT
client_key               "#{File.dirname(__FILE__)}/vagrant.pem"
validation_client_name   "chef-validator"
validation_key           "#{File.dirname(__FILE__)}/validation.pem"
cache_type               "BasicFile"
cache_options( :path => "#{File.dirname(__FILE__)}/checksums" )
cookbook_path             "#{File.dirname(__FILE__)}/../cookbooks"
