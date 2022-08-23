class Mussic < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date, archived, id = Ramdon.rand(1..100))
    super(publish_date, archived, id)
    @on_spotify = on_spotify
  end

end
