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
    song = self.new
    song.save
    return song 
  end

  def self.new_by_name name
     song = self.new
     song.name = name
     song
    #  binding.pry
  end

  def self.create_by_name name
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name name
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name name
    if self.find_by_name name 
       self.find_by_name name 
    else 
      self.create_by_name name       
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name 
    end
  end

  def self.new_from_filename filename
    song_arr = filename.split (' - ')
    song = Song.new
    song.name = song_arr[1].split('.')[0]
    song.artist_name = song_arr[0]
    song

    # binding.pry
  end

  def self.create_from_filename filename
    (self.new_from_filename filename).save     
  end

  def self.destroy_all
    @@all = []
  end

end

  
