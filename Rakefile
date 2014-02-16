require 'data_mapper'
require './app/data_mapper_config'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade is now complete. No data has been lost.'
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Auto-migrate is now complete. This may have caused data to be lost.'
end
