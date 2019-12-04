require 'yaml'
require 'active_record'

CONFIG_DATABASE = YAML.load(File.read('config/database.yml'))[ENV.fetch('RUBY_ENV')]
#
ActiveRecord::Base.establish_connection(CONFIG_DATABASE)
