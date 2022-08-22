class item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize (id, genre, author, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = false
  end

end
