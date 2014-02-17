class Peep

  include DataMapper::Resource
  belongs_to :maker

  property :id, Serial
  property :body, Text
  property :created_at, Time

  def time_format
    created_at.strftime("On %A (%d/%m/%y) , at %I:%M%p")
  end
end
