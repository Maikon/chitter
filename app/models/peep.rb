class Peep

  include DataMapper::Resource
  has 1, :maker, :through => Resource

  property :id, Serial
  property :body, Text
  property :created_at, Time

end
