class MusicImporter
  attr_accessor :path

  @@normalized_files = []

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    files = Dir["#{@path}/*.mp3"]
    @@normalized_files.clear
    files.each do |filename|
      file = File.basename(filename)
      @@normalized_files << file
    end
    @@normalized_files
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
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
