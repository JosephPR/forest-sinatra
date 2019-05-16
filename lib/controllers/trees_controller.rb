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
      redirect "/trees/#{@tree.id}"
  end

  # show
  get "/trees/:id" do
    @tree = Tree.find_by_id(params[:id])
    erb :show
  end

  # load edit form
  get "/trees/:id/edit" do
    @tree = Tree.find_by_id(params[:id])
    erb :edit
  end

  # update(edit)
  patch "/trees/:id" do
    @tree = Tree.find(params[:id])
    @tree.spieces = params[:species]
    @tree.height  = params[:height]
    @tree.save
    redirect to "/trees/#{ @tree.id }"
  end

  #destroy
  delete '/articles/:id/delete' do #delete action
    @tree = Tree.find_by_id(params[:id])
    @tree.delete
    redirect to '/trees'
  end



end
