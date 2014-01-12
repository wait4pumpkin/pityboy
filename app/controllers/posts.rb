Pityboy::App.controllers :posts do

  get :index do
    @posts = Post.all(:order => 'created_at desc')
    render 'posts/index'
  end

  get :index, :with => :url do
      @post = Post.find_by_id(params[:id])
      render 'posts/show'
  end
end
