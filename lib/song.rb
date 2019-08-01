require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    # super
    @name = name
    @artist = artist
    if artist != nil
      self.artist = artist
    end
    @genre = genre
    if genre != nil
      self.genre = genre
    end

  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
    else
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_item = self.new(name)
    self.all << new_item
    new_item
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #if self.find_by_name(name)
    #  self.find_by_name(name)
    #else
    #  self.create_by_name(name)
    #end
    # above is same as below
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    artist = Artist.find_or_create_by_name(split[0])
    genre = Genre.find_or_create_by_name(split[2].delete_suffix('.mp3'))
    new_song = Song.new(split[1], artist, genre)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end
end

# rspec spec/001_song_basics_spec.rb
# rspec spec/002_artist_basics_spec.rb
# rspec spec/003_genre_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/005_songs_and_genres_spec.rb
# rspec spec/006_artists_and_genres_spec.rb
# rspec spec/007_findable_songs_spec.rb
# rspec spec/008_findable_module_spec.rb
# rspec spec/009_music_importer_spec.rb
# rspec spec/0010_music_library_controller_spec.rb
# rspec spec/0011_music_library_cli_methods_spec.rb
# rspec spec/0012_music_library_cli_spec.rb
