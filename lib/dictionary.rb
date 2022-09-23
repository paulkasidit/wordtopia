class Word
  attr_reader :id, :word, :definition
  attr_accessor :word, :definition 
  @@words = {} 
  @@total_rows = 0 

def initialize(word, definition) 
  @word = word 
  @definition = definition 
  @id = id || @@total_rows += 1 
end

#display words
def self.all 
  @@words.values()
end 

#update/edit words 

#add words 

#delete words 

#view word definition? 

end

