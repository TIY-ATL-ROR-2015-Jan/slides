require 'pry'

class Song
  def initialize(artist, title, duration)
    @artist = artist
    @title = title
    @duration = duration
  end

  def to_s
    minutes = @duration / 60
    seconds = @duration % 60
    "Song: #{@artist} - #{@title} (#{minutes}:#{seconds})"
  end
end

binding.pry
