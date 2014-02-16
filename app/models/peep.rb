class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, Time

end
