require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do 
  if params["search"]
    @words = Word.search_word(params[:search_word])
  else
    @words = Word.all
  end
  erb(:word)
end

  get ('/word/new') do 
    erb(:new_word)
  end

# # post('/words') do 
# #   new_word = params[:word]
# #   word = Words.new({:word => new_word, :id => nil})
# #   word.save()
# #   redirect to('/')
# # end

# get('/words/:id') do
#   @words = Word.find(params[:id].to_i())
#   erb(:word)
# end




