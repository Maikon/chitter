get '/' do
  @peeps = Peep.all(:order => [:created_at.desc])
  erb :index
end

post '/peeps' do
  body = params[:body]
  Peep.create(:body => body)
  redirect to('/')
end
