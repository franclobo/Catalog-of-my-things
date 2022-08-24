require_relative '../music_album'

describe MussicAlbum do
  context 'When testing the music album class' do
    before(:all) do
      @album = MussicAlbum.new(true, 2000, true)
    end

    it 'can be archive' do
      expect(@album.can_be_archive?).to be true
    end
  end
end
