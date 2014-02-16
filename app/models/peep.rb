class Peep

  include DataMapper::Resource
  # has 1, :maker, :through => Resource
  belongs_to :maker

  property :id, Serial
  property :body, Text
  property :created_at, Time
  property :maker_id, Integer

end
