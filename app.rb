require('sinatra')
require('sinatra/reloader')
require('./lib/dictionary')
require('pry')
also_reload('lib/**/*.rb') 

get ('/') do 
  @words = Word.all 
  erb(:home_page)
end

get ('/word/new') do 
  erb(:new_word)
end 



