require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb') 

get ('/') do 
  @word = Word.all 
  erb(:home_page)
end

get ('/word') do 
  @word = Word.all 
  erb(:home_page)
end

get ('/word/new') do 
  erb(:new_word) 
end

post ('/word') do 
  name = params[:word]
  word = Word.new({:word => name,:id => nil})
  word.save()
  redirect to('/word')
end

get ('/word/:id') do 
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get ('/word/:id/update') do
  @word = Word.find(params[:id].to_i()) 
  erb(:update_word)
end

patch ('/word/:id') do 
  @word = Word.find(params[:id].to_i())  
  @word.update(params[:word])
  redirect to('/word')
end

delete ('/word/:id') do 
  @word = Word.find(params[:id].to_i())   
  @word.save()
  redirect to('/word')
end





