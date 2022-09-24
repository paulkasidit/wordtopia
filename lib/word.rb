class Word
  attr_reader :id, :word, :definition
  attr_accessor :word, :definition 
  @@words = {} 
  @@total_rows = 0 

  def initialize(word) 
    @word = word 
    @id = id || @@total_rows += 1 
  end

  #display words
  def self.all 
    @@words.values()
  end 

  #view word definition?  
  # def self.definition 
  #   @@word.delete(self.)
  #update/edit words 

  #add words 
  # def save 
  #   @@words[self.id] == Word.new({:word = self.word, :id => self.id}) 
  # end

  #delete words 
  def delete
    @@words.delete(self.id) 
  end

  def save 
    @@words[self.id] = Word.new(self.word)
  end

end


