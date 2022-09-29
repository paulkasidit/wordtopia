require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb') 

get ('/') do 
  @word = Word.all 
  erb(:home_page)
end

get ('/words') do 
  @word = Word.all 
  erb(:home_page)
end

get ('/words/new') do 
  erb(:new_word) 
end

post ('/words') do 
  name = params[:word]
  word = Word.new({:word => name,:id => nil})
  word.save()
  redirect to('/word')
end

get ('/words/:id') do 
  @word = Word.find(params[:id].to_i())
  erb(:word)
end

get ('/words/:id/update') do
  @word = Word.find(params[:id].to_i()) 
  erb(:update_word)
end

patch ('/words/:id') do 
  @word = Word.find(params[:id].to_i())  
  @word.update(params[:word])
  redirect to('/word')
end

delete ('/words/:id') do 
  @word = Word.find(params[:id].to_i())   
  @word.save()
  redirect to('/word')
end





