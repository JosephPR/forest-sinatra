class TreesController < Sinatra::Base
  configure do
    set :views, "lib/views"
  end

  get '/' do
    redirect to "trees"
  end
  #index
  get "/trees" do
    @trees = Tree.all
    erb :index
  end
  #new
  get "/trees/new" do
    @tree = Tree.new
    erb :new
  end
  #create
  post "/trees" do
    @tree = Tree.create ({
    species:  params[:species],
    height: params[:height]
      })
      redirect "/trees"
  end

  # show
  get "/trees/:id" do
    @tree = Tree.find(params[:id])
    erb :show
  end

  # edit
  get "/trees/:id/edit" do
    @tree = Tree.find(params[:id])
    erb :edit
  end

  # update
  patch "/trees/:id" do
    @tree = Tree.find(params[:id])
    @tree.update(params[:species])
    redirect to "/trees/#{ @tree.id }"
  end

  #destroy
  delete "/trees/:id" do
    Tree.destroy(params[:id])
    redirect to "/trees"
  end



end
