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

  describe('#==') do 
    it ('tests does not cofuse word duplicates as seperate objects') do
      word1 = Word.new({:word => "Jungle",:id => nil})
      word1.save 
      word2 = Word.new({:word => "Jungle",:id => nil})
      word2.save
      expect(word1).to(eq(word2)) 
    end
  end
  
  describe('#.save') do 
    it ('saves a word to the Word hash') do 
      expect(Word.all).to(eq([@word1]))
    end
  end
  
  describe('.clear_database') do 
    it ('clears all contents of the Words class/database') do
      Word.clear_database 
      expect(Word.all).to(eq([]))
    end
  end

  describe('#update') do 
    it ('updates word while keeping id') do 
      @word1.update("Taffy")
      expect(@word1.word).to(eq("Taffy"))
    end
  end

  describe('#delete') do 
    it ('deletes a specific word from Word hash') do 
    @word1.delete
    expect(Word.all).to(eq([]))
    end
  end

  describe('find_word_by_id') do 
    it ('return a word in the has with a matching id') do 
      expect(Word.find_word_by_id(@word1.id)).to(eq(@word1))
    end
  end

  describe('#definition') do 
    it ('returns an array of associated defintion with the word') do 
    definition1 = Definition.new(id: nil, word_id: @word1.id, definition: "Candy on a stick")
    definition1.save()
    expect(@word1.definition).to(eq([definition1]))
    end
  end

  describe('#delete_definition') do
    it ('will delete associated defenitions with word') do 
      definition1 = Definition.new(id: nil, word_id: @word1.id, definition: "Candy on a stick")
      definition1.save()
      @word1.delete_definition()
      expect(@word1.definition).to(eq([]))
    end
  end

  describe('.search_word') do 
    it('returns a list of words that match string input') do
    word2 = Word.new(attributes2)
    word2.save()
    word3 = Word.new({:word => 'Fox', :id => nil })
    word3.save()
    word5 = Word.new({:word => 'Hydro', :id => nil})
    word5.save()
    expect(Word.search_word("Hydro")).to(eq([word5]))
    end
  end

end

