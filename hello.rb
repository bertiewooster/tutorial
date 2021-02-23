require 'sinatra'
require 'rack/handler'
Rack::Handler::WEBrick = Rack::Handler.get(:puma)

get '/' do
  'Hello, world! Hello, Elmo!'
end

# :x is required for matching
# Try /x/testing
# Will not match /x because no trailing slash provided
# Will not match /x/ because :x param is missing
get '/x/:x' do
  "x is #{params['x']}"
end

# :y is optional with the ?
# Try /y/testing
# Will not match /y because trailing slash is required
# Will match /y/ since :y is optional
get '/y/myurl?i' do |y|
  "y is #{y}, i is #{params[:i]}"
end

# :z is required for matching
# Try /z/testing
# Will not match /z because no trailing slash provided
# Will not match /z/ because :x param is missing
get '/z/:z' do
  erb :index
end
