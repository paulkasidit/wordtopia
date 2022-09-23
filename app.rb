require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
require('pry')
also_reload('lib/**/*.rb') 

get ('/') do 
  @words = Word.all 
  erb(:words)
end

get ('/word/new') do 
  erb(:new_word)
end 


