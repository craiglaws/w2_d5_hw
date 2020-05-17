require('minitest/autorun')
require('minitest/reporters')
require_relative('../song')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestSong < MiniTest::Test
  def setup()

    @song1 = Song.new("ABBA", "Dancing Queen")
    @song2 = Song.new("Elton John", "Rocketman")
    @song3 = Song.new("Foo Figthers", "My Hero")

  end


  def test_song_setup
    assert_equal("ABBA", @song1.artist)
    assert_equal("Rocketman", @song2.title)
  end
end
