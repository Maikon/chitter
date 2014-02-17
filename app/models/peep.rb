class Peep

  include DataMapper::Resource
  belongs_to :maker

  property :id, Serial
  property :body, Text
  property :created_at, Time

end
