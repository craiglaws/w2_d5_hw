require('minitest/autorun')
require('minitest/reporters')
require_relative('../guest')
require_relative('../song')
require_relative('../room')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestGuest < MiniTest::Test
  def setup()

    @eighties_room = Room.new("80's Room", 2)
    @guest1 = Guest.new("Craig", 50)
    @song1 = Song.new("ABBA", "Dancing Queen")
    @song2 = Song.new("Elton John", "Rocketman")
    @song3 = Song.new("Foo Figthers", "My Hero")


  end

  def test_guest_setup
    assert_equal("Craig", @guest1.name)
    assert_equal(50, @guest1.cash)
  end

  def test_guest_fav_song
    @guest1.guest_fav_song(@song1.artist, @song1.title)
    assert_equal("ABBA", @guest1.fav_song.artist)
  end


  def test_check_fav_song
    @guest1.guest_fav_song(@song1.artist, @song1.title)
    assert_equal("Whooo, my favourite!!", @guest1.check_fav_song(@song1))
  end

  def test_check_fav_song_artist
    @guest1.guest_fav_song("ABBA", "Gimme, Gimme, Gimme")
    assert_equal("Not my favourite but it'll do!!", @guest1.check_fav_song(@song1))
  end

  def test_dont_have_fav_song
    @guest1.guest_fav_song(@song2.artist, @song2.title)
    assert_equal("Aww you don't have my favourite song", @guest1.check_fav_song(@song1))
  end 


end
