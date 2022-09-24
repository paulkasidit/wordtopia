require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb') 

get ('/') do 
  @words = Word.all 
  erb(:home_page)
end

get ('/word') do 
  @word = Word.all 
  erb(:home_page) 
end

post ('/word') do 
  name = params[:word]
  word = Word.new({:word => name,:id => nil})
  word.save()
  redirect to('/word')
end

get ('/word/new') do 
  erb(:new_word)
end 



