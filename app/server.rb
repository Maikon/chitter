require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'

require_relative 'data_mapper_config'
require_relative 'models/peep'
require_relative 'models/maker'
require_relative 'controllers/makers'
require_relative 'controllers/application'
require_relative 'controllers/helpers/cmaker'

enable :sessions
set :session_secret, 'i_like_cats_@lot'
