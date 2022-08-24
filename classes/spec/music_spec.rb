require_relative '../music_album'

describe MusicAlbum do
  context 'When create a music album' do
    before(:all) do
      @music_album = MusicAlbum.new('Yes', 2019, 2010)
    end

    it 'can be archived? if on spotify' do
      expect(@music_album.scan_be_archive?).to be true
    end
  end
end
