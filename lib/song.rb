require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  

  def self.all
    @@all
  end

  def save 
    self.class.all << self 
  end

  def self.create 
    song = Song.new
    song.save
    return song 
  end

  def self.new_by_name name
     song = Song.new
     song.name = name
     song
    #  binding.pry
  end

  def self.create_by_name name
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name name
    @@all.find do |song|
      song.name == name
    end
  end

  def find_or_create_by_name name
    if self.find_by_name
      return
    else 
      song = Song.new
      song.name = name
      song
   
      
    end
  end

end
