get '/makers/new' do
  @maker = Maker.new
  erb :'makers/new'
end

post '/makers' do
  @maker = Maker.create(:name => params[:name],
                        :username => params[:username],
                        :email => params[:email],
                        :password => params[:password])
  session[:maker_id] = @maker.id
  redirect to('/')
end
