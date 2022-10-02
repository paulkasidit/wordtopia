require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('instantiates a new word hash and gets a word path', {:type => :feature}) do
  it('instantiates a new word hash and redirects to the word page') do
    visit('/')
    click_on('Add a new word')
    fill_in('word', :with => 'Lollipop')
    click_on('Add new word')
    expect(page).to have_content('Lollipop')
  end
end

describe('updates word path', {:type => :feature}) do
  it('updates word has and redirects to the word page') do
    Word.clear_database
    word = Word.new({:word => 'Lollipop', :id => nil})
    word.save
    visit("/word/#{word.id}")
    click_on('Edit')
    fill_in('update_word', :with => 'Taffy')
    click_on('Update')
    expect(page).to have_content('Taffy')
  end
end

describe('delete a word path', {:type => :feature}) do
  it('deletes a word and redirects back to home page') do
    Word.clear_database
    word = Word.new(word: 'Lollipop', id: nil)
    word.save
    visit("/word/#{word.id}")
    click_on('Edit')
    click_on('Delete word')
    expect(page).to have_no_content('Lollipop')
  end
end

describe('creates a definition path', {:type => :feature}) do
  it('instantiates a new definition hash and then gets a definition path') do
    Word.clear_database
    Definition.clear_database
    word = Word.new(word: 'Lollipop', id: nil)
    word.save
    visit("/word/#{word.id}")
    fill_in('definition', :with => 'Candy on a stick')
    click_on('Add a new definition')
    expect(page).to have_content('Candy on a stick')
  end
end

describe('deletes a definition path', {:type => :feature}) do
  it('clears definition hashes and redirects back to the word page') do
    Word.clear_database
    Definition.clear_database
    word = Word.new(word: 'Lollipop', id: nil)
    word.save
    definition = Definition.new(definition: 'Candy on a stick', id: nil, word_id: word.id)
    definition.save()
    visit("/word/#{word.id}")
    click_on('Candy on a stick')
    click_on('Delete definition')
    expect(page).to have_no_content('Candy on a stick')
  end
end

describe('updates a definition path', {:type => :feature}) do
  it('updatess a definintion hash and redirects back to the word page') do
    Word.clear_database
    Definition.clear_database
    word = Word.new(word: 'Lollipop', id: nil)
    word.save
    definition = Definition.new(definition: 'Candy on a stick', id: nil, word_id: word.id)
    definition.save()
    visit("/word/#{word.id}")
    click_on('Candy on a stick')
    fill_in('new_definition', :with => 'Stick confectionary')
    click_on('Update')
    expect(page).to have_content('Stick confectionary')
  end
end