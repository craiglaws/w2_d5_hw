require('minitest/autorun')
require('minitest/reporters')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestRoom < MiniTest::Test
  def setup()
    @eighties_room = Room.new("80's Room", 2)

    @song1 = Song.new("ABBA", "Dancing Queen")
    @song2 = Song.new("Elton John", "Rocketman")
    @song3 = Song.new("Foo Figthers", "My Hero")

    @guest1 = Guest.new("Craig", 50)
    @guest2 = Guest.new("Emily", 30)
    @guest3 = Guest.new("Liam", 10)

  end


  def test_room_setup
    assert_equal("80's Room", @eighties_room.name)
    assert_equal(0, @eighties_room.songs.length)
    assert_equal(2, @eighties_room.capacity)
    assert_equal(0, @eighties_room.room_guests.length)
  end



  def test_add_song_to_room
    @eighties_room.add_song_to_room(@song1)
    assert_equal(1, @eighties_room.songs.length)
    @eighties_room.add_song_to_room(@song1)
    assert_equal(1, @eighties_room.songs.length)
  end


  def test_add_guest_to_room
    @eighties_room.add_guest_to_room(@guest1)
    assert_equal(1, @eighties_room.room_guests.length)
  end

  def test_capacity_on_rooms
    @eighties_room.add_guest_to_room(@guest1)
    @eighties_room.add_guest_to_room(@guest2)
    @eighties_room.add_guest_to_room(@guest3)
    assert_equal(2, @eighties_room.room_guests.length)
  end


  def test_get_guest
    @eighties_room.add_guest_to_room(@guest1)
    @eighties_room.add_guest_to_room(@guest2)
    assert_equal(@guest1, @eighties_room.get_guest(@guest1))
    assert_equal(1, @eighties_room.room_guests.length)
  end




end
