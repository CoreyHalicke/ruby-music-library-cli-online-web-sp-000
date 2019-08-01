class MusicLibraryController
  attr_accessor :path

  @@counter = 1
  @@song_list = []
  @@artist_list = []
  @@genre_list = []


  def initialize(path = './db/mp3s')
    @path = path
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_request = ""
    until user_request == "exit" do
      user_request = gets.strip
    end
  end

  def list_songs
    @@song_list = []
    list_songs = []
    list_songs = Song.all.sort_by {|n| n.name}
    list_songs.each do |song|
      song_name = song.name
      artist_name = song.artist.name
      genre_name = song.genre.name
      @@song_list << "#{@@counter},#{song_name},#{genre_name}".split(",")
      puts "#{@@counter}. #{artist_name} - #{song_name} - #{genre_name}"
      @@counter += 1
    end
      @@counter = 1
  end

  def list_artists
    @@artist_list = []
    list_artists = []
    list_artists = Artist.all.sort_by {|n| n.name}
    list_artists.each do |artist|
      artist_name = artist.name
      # @@artist_list << "#{@@counter},#{artist_name}".split(",")
      puts "#{@@counter}. #{artist_name}"
      @@counter += 1
    end
      @@counter = 1
  end

  def list_genres
    @@genre_list = []
    list_genres = []
    list_genres = Genre.all.sort_by {|n| n.name}
    list_genres.each do |genre|
      genre_name = genre.name
      # @@genre_list << "#{@@counter},#{genre_name}".split(",")
      puts "#{@@counter}. #{genre_name}"
      @@counter += 1
    end
      @@counter = 1
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    artist_songs = Artist.find_by_name(artist_input)
    if artist_songs != nil
      sorted_artist_songs = artist_songs.songs.sort_by {|n| n.name}
      sorted_artist_songs.each do |song|
        song_name = song.name
        genre_name = song.genre.name
        puts "#{@@counter}. #{song_name} - #{genre_name}"
        @@counter +=1
      end
      @@counter = 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre_songs = Genre.find_by_name(genre_input)
    if genre_songs != nil
      sorted_genre_songs = genre_songs.songs.sort_by {|n| n.name}
      sorted_genre_songs.each do |song|
        song_name = song.name
        artist_name = song.artist.name
        puts "#{@@counter}. #{artist_name} - #{song_name}"
        @@counter +=1
      end
      @@counter = 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_input = gets.strip
      @@song_list.each do |song|
        if song[0] == song_input
        end
        binding.pry
        # if song[0] == song_input
        #
        # end
      end
      # song_choice = @@song_list.find {|s| s[0] == song_input}
  end

end
