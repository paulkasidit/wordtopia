class Word
  attr_reader :id, :word

  @@words = {} 
  @@total_rows = 0 

  def initialize(attributes) 
    @word = attributes.fetch(:word)
    @id = attributes.fetch(:id) || @@total_rows += 1 
  end

  def self.all 
    @@words.values
  end 

  def save 
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end

  def ==(word_to_compare)
    self.word == word_to_compare.word
  end

  def self.clear_database 
    @@words = {} 
    @@total_rows = 0 
  end

  def update(word) 
    @word = word 
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
  end
  
  def delete
    @@words.delete(self.id) 
  end

  def self.find_word_by_id(id) 
    @@words[id] 
  end

  def definition
    Definition.find_definition_by_word(self.id)
  end

  def delete_definition 
    definition_array =  Definition.find_definition_by_word(self.id)
    if definition_array != []
      definition_array.each do |definition| 
        Definition.delete_by_id(definition.id)
      end
    end
  end

  def self.search_word(search_word)
    @@words.values().select{|word| word.word == search_word}
  end

end



