class TreesController < Sinatra::Base
  configure do
    set :views, "lib/views"
  end
  get "/" do
    @trees = Tree.all
    erb :index
  end
end
