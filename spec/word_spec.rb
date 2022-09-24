require 'rspec'
require 'word'

describe '#Word' do 

  #?
  before(:each) do 
    Word.clear()
  end

  #passing
  describe('.all') do 
    it ("returns an empty array when there is no words") do
      expect(Word.all).to(eq(([])))
    end
  end

  #failing
  describe('#save') do 
    it ("save a word") do 
      word1 = Word.new({:word => "Fire", :id => nil })
      word1.save()
      word2 = Word.new({:word => "Wind", :id => nil })
      word2.save() 
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  #failing
  describe(".find") do 
    it ("finds a word by id") do 
      word1 = Word.new({:word => "Fire", :id => nil })
      word1.save()
      word2 = Word.new({:word => "Water", :id => nil })
      word2.save()
      expect(Word.find(word1.id)).to(eq(word1))
    end
  end


  #passing
  describe('.clear') do
    it("clears database") do
      word1 = Word.new({:word => "Fire", :id => nil })
      word1.save()
      word2 = Word.new({:word => "Water", :id => nil })
      word2.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end


end
