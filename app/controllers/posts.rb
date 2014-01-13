Pityboy::App.controllers :posts do

  get :index, :map => '/blog' do
    @posts = Post.all(:order => 'created_at desc')
    render 'posts/index'
  end

  get :index, :map => '/blog/:category/:url' do
    @post = Post.includes(:category, :account)
                .where({ categories: { url: params[:category] }, posts: { url: params[:url] } })
                .limit(1).first
    render 'posts/show'
  end
end
