require('minitest/autorun')
require('minitest/reporters')
require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestKaraoke < MiniTest::Test
  def setup()
    @Cosmopol = Karaoke_bar.new("Cosmopol")

    @eighties_room = Room.new("80's Room", 2)

    @song1 = Song.new("ABBA", "Dancing Queen")
    @song2 = Song.new("Elton John", "Rocketman")
    @song3 = Song.new("Foo Figthers", "My Hero")

    @guest1 = Guest.new("Craig", 50)
    @guest2 = Guest.new("Emily", 30)
    @guest3 = Guest.new("Liam", 10)

  end

  def test_karaoke_bar_setup
    assert_equal("Cosmopol", @Cosmopol.name)
    assert_equal(0, @Cosmopol.rooms.length)
    assert_equal(0, @Cosmopol.guests.length)
    assert_equal(0, @Cosmopol.till)
  end

  def test_add_room_to_bar
    @Cosmopol.add_room(@eighties_room)
    assert_equal(1, @Cosmopol.rooms.length)
  end

  def test_add_songs_to_room
    @Cosmopol.add_room(@eighties_room)
    @eighties_room.add_song_to_room(@song2)
    assert_equal(1, @Cosmopol.rooms[0].songs.length)
  end


  def test_let_guest_in_bar
    @Cosmopol.let_guest_in_bar(@guest2)
    assert_equal(1, @Cosmopol.guests.length)
  end

  def test_charges_admission
    @Cosmopol.let_guest_in_bar(@guest1)
    assert_equal(35, @guest1.cash)
    assert_equal(15, @Cosmopol.till)
  end

  def test_put_guest_in_room
    @Cosmopol.let_guest_in_bar(@guest1)
    @Cosmopol.add_room(@eighties_room)
    @Cosmopol.put_guest_in_room(@eighties_room, @guest1)
    assert_equal(1, @Cosmopol.rooms[0].room_guests.length)
  end 

  def test_get_guest_out_of_room
    @Cosmopol.let_guest_in_bar(@guest1)
    @Cosmopol.let_guest_in_bar(@guest2)
    @Cosmopol.add_room(@eighties_room)
    @Cosmopol.put_guest_in_room(@eighties_room, @guest1)
    @Cosmopol.put_guest_in_room(@eighties_room, @guest2)
    @Cosmopol.take_guest_out_of_room(@eighties_room, @guest1)
    assert_equal(1, @Cosmopol.guests.length)
    assert_equal(1, @Cosmopol.rooms[0].room_guests.length)
  end



end
