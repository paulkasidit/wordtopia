require 'rspec'
require 'word'
require 'definition' 

describe '#Definition' do 

  before(:each) do
    Definition.clear_database
    Word.clear_database
    @word1 = Word.new({:word => "Lollipop", :id => nil})
    @word1.save
    @attributes = {id: nil, word_id: @word1.id, definition: "Candy on a stick"}
  end

  describe('.all') do 
    it ('returns an array of all definitions saved in the hash') do 
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do 
    it ('tests does not cofuse word duplicates as seperate objects') do
      definition1 = Definition.new(@attributes)
      definition1.save 
      definition2 = Definition.new({:id => nil, :word_id => @word1.id, :definition => "Candy on a stick"})
      definition2.save
      expect(definition1).to(eq(definition2)) 
    end
  end

  describe('#save') do
    it('saves definition to definition hash') do
      definition = Definition.new(@attributes)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.clear_database') do
    it('clears all contents of the Definition class/database') do
      definition = Definition.new(@attributes)
      definition.save 
      Definition.clear_database
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#update') do
    it('updates definition while keeping id') do
      definition = Definition.new(@attributes)
      definition.save 
      definition.update("Stick confectionery.")
      expect(definition.definition).to(eq("Stick confectionery."))
    end
  end

  describe('#delete') do 
    it ('deletes a specific definition from Definition hash') do 
    definition = Definition.new(@attributes)
    definition.save 
    definition.delete
    expect(Definition.all).to(eq([]))
    end
  end

  describe('find_definition_by_id') do 
    it ('return a definition in the hash with a matching id') do 
      definition = Definition.new(@attributes)
      definition.save 
      expect(Definition.find_definition_by_id(definition.id)).to(eq(definition))
    end
  end

  describe('.find_definition_by_word') do
    it('returns a list of definitions that match word id input') do
      word2 = Word.new({:word => "Bubblegum", :id => nil})
      word2.save
      definition1 = Definition.new(@attributes)
      definition1.save
      definition2 = Definition.new({:id => nil,:word_id => word2.id, definition: "Chewy candy"})
      definition2.save 
      expect(Definition.find_definition_by_word(word2.id)).to(eq([definition2]))
    end
  end
  



end
