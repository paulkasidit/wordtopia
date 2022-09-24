require 'rspec'
require 'word'

describe '#Word' do 

  before(:each) do 
    Word.clear()
  end

  describe('.all') do 
    it ("returns an dictionary when there is no words") do
      expect(Word.all).toeq(([]))
    end
  end

  describe('#save') do 
    it ("save a word") do 
      word1 = Word.new("Fire",nil)
      word1.save()
      word2 = Word.new("Wind",nil)
      word2.save() 
      expect(Word.all).to(eq({Fire:}))
end
