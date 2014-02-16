require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'
require 'rack-flash'

require_relative 'data_mapper_config'
require_relative 'models/peep'
require_relative 'models/maker'
require_relative 'controllers/makers'
require_relative 'controllers/application'
require_relative 'controllers/sessions'
require_relative 'helpers/cmaker'

enable :sessions
set :session_secret, 'i_like_cats_@lot'
use Rack::Flash
set :partial_template_engine, :erb
