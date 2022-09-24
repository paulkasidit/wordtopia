require 'rspec'
require 'word'

describe '#Word' do 

  before(:each) do 
    Word.clear()
  end

  describe('.all') do 
    it ("returns an dictionary when there is no words") do
      expect(Word.all).to(eq(([])))
    end
  end

  describe('#save') do 
    it ("save a word") do 
      word1 = Word.new({:word => "Fire", :id => nil })
      word1.save()
      word2 = Word.new({:word => "Wind", :id => nil })
      word2.save() 
      expect(Word.all).to(eq(['Fire','Wind']))
    end
  end

end
