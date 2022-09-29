require 'rspec'
require 'word'
require 'definition'

describe '#Word' do 

  before(:each) do 
    Word.clear_database 
    Definition.clear_database 
    @attributes1 = { word: 'Lollipop',id: nil}
    @attributes2 = { word: 'Bubblegum',id: nil}
    @word1 = Word.new(@attributes1)
    @word1.save 
  end

  describe('.all') do
    it('returns array of all words stored in the Word instantiated hash') do
      expect(Word.all).to(eq([@word1]))
    end
  end

  

end

