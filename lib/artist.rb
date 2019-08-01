require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable

  @@all = []
  @@genres = []

  def initialize(name)
    # super
    @name = name
    @songs = []
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

  def add_song(song)
    # binding.pry
    if defined?(song.artist.name)
    else
      song.artist = self
    end

    if @songs.include?(song)
    else
      @songs << song
    end
  end

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end

  def genres
    @@genres.clear
    self.songs.collect do |song|
      @@genres << song.genre
    end
    @@genres.uniq
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
