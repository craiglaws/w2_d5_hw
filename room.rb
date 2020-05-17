class Room


  attr_reader :name, :songs, :capacity, :room_guests

  def initialize(name, capacity)

    @name = name
    @songs = []
    @capacity = capacity
    @room_guests = []
  end


  def add_song_to_room(song)
    if !@songs.include?(song)
      @songs.push(song)
    end
  end


  def add_guest_to_room(guest)
    if @capacity > @room_guests.length
      @room_guests.push(guest)
      for song in @songs
        guest.check_fav_song(song)
      end
    end
  end

  def get_guest(guest)
    for room_guest in @room_guests
      if room_guest == guest
        @room_guests.delete(room_guest)
      end
    end
  end


end
