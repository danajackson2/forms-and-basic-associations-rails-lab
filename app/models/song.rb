class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
  
  def words=(array)
    array.each do |blurb|
      note = Note.create(content: blurb)
      self.notes << note
    end
  end
end
