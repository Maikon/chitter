get '/' do
  @peeps = Peep.all(order: [:created_at.desc])
  erb :index
end

post '/peeps' do
  body = params[:body]
  created_at = params[:created_at]
  maker = current_maker
  Peep.create(body: body, created_at: created_at, maker_id: maker.id)
  redirect to('/')
end
