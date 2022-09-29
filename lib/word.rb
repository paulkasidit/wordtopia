class Word
  attr_reader :id, :word

  @@words = {} 
  @@total_rows = 0 

  def initialize(attributes) 
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_rows += 1 
  end

  #update words 
  def update(word) 
    @word = word 
  end
  
  #display words
  def self.all 
    @@words.values
  end 

  #save words
  def save 
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end
  
  #delete words 
  def delete
    @@words.delete(self.id) 
  end

  #clear database
  def self.clear 
    @@words = {} 
    @@total_rows = 0 
  end
  
  #find word
  def self.find(id) 
    @@words[id] 
  end

  #ryans code
  def ==(word)
    self.word == word.word && self.id == word.id
  end

end



