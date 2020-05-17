class Guest

  attr_reader :name
  attr_accessor :cash, :fav_song

  def initialize(name, cash)
    @name = name
    @cash = cash
    @fav_song = []
  end


  def guest_fav_song(artist, title)
    @fav_song = Song.new(artist, title)
  end



  def check_fav_song(song)
    response = false
    if song.artist == @fav_song.artist
      response = true
      if song.title == @fav_song.title
        return "Whooo, my favourite!!"
      end
    end
    if response == true
      return "Not my favourite but it'll do!!"
    else
      return "Aww you don't have my favourite song"
    end
  end
end
