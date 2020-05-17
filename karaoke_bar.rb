
class Karaoke_bar

  attr_reader :rooms, :guests, :name, :till, :entry_fee

  def initialize(name)
    @name = name
    @rooms = []
    @guests = []
    @till = 0
    @entry_fee = 15
  end


  def add_room(room)
    @rooms.push(room)
  end

  def let_guest_in_bar(guest)
    if guest.cash >= @entry_fee
      guest.cash -= @entry_fee
      @till += @entry_fee
      @guests.push(guest)
    end
  end


  def take_guest_out_of_room(room, guest)
    room.get_guest(guest)
    @guests.push(guest)
  end

  def put_guest_in_room(room, guest)
    room.add_guest_to_room(guest)
    @guests.delete(guest)
  end



end
