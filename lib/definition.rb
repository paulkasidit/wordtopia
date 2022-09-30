class Definition 

  attr_reader :id 
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0 

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1 
  end

  def self.all 
    @@definitions.values()
  end 

  def save 
    @@definitions[self.id] = Definition.new({:definition => self.definition, :id => self.id, :word_id => self.word_id})
  end

  def ==(definition_to_compare) 
    self.definition == definition_to_compare.definition
  end 

  def self.clear_database 
    @@definitions =  {} 
    @@total_rows = 0 
  end
  
  def update(new_defintion)
    self.definition = new_definition 
    @@definitions[self.id] = Definition.new({:definition => self.definition, :word_id => self.word_id, :id => self.id})
  end

  def delete 
    @@definitions.delete(self.id)
  end

  def self.delete_by_id(id) 
    @@definitions.delete(id)
  end


  def self.find_definition_by_id(id) 
    @@definitions[id]
  end


  def self.find_definition_by_word(search_word_id) 
    definitions = [] 
    @@definitions.values.each do |definition| 
      if definition.word_id = search_word_id 
        definitions.push(definition)
      end
    end
    definitions
  end

end