get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  username = params[:username]
  password = params[:password]
  maker = Maker.authenticate(username, password)
  if maker
    session[:maker_id] = maker.id
    redirect to('/')
  else
    flash[:errors] = ['The email or password are incorrect.']
    erb :'sessions/new'
  end
end
