class Definition 

  attr_reader :id 
  attr_accessor :word, :word_id

  @@definitions = {} 
  @@total_rows = 0 

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1 
  end

  def self.all 
    @@definitions.values
  end 

  def save 
    @@definitions[self.id] = Definition.new({:definition => self.definition, :word_id => self.word_id, :id => self.id})
  end

  def self.find(id) 
    @@definitions[id]
  end

  def update(definition,word_id)
    self.definition = definition 
    self.word_id = word_id 
    @@definitions[self.id] = Definition.new({:definition => self.definition, :word_id => self.word_id, :id => self.id})
  end

  def ==(defintion_to_compare)
    self.definition = defintion_to_compare.definition
  end

  def delete 
    @@definitions.delete(self.id)
  end

  def slef.find(id) 
    @@definitions[id]
  end
  
  def self.find_definition_by_word(word_id) 
    definitions = [] 
    @@definitions,.values.each do |definition| 
      if definition.word_id = word_id 
        definitions.push(definition)
      end
    end
  end

end