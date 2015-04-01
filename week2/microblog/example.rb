
  get '/upload' do
    erb :"upload.html"
  end

  post '/upload.html' do
    @idea = Idea.create(
      # :image_url   => params[] -- FILE UPLOAD LATER
      :title       => params["title"],
      :description => params["description"],
      :author      => params["author"],
      :created_at  => Time.now
    )
    redirect to('/success.html')
  end

  get '/idea/:id/edit.html' do
    @idea = Idea.get(params[:id])
    erb :"edit.html"
  end

  post '/idea/:id/edit.html' do
    @idea = Idea.get(params[:id])
    @idea.update(
      # :image_url   => params[] -- FILE UPLOAD LATER
      :title       => params["title"],
      :description => params["description"],
      :author      => params["author"],
      :created_at  => Time.now
    )
    @idea.save
    redirect to('/success.html')
  end

  get '/idea/:id/delete.html' do
    @idea=Idea.get(params[:id])
    @idea.destroy
    redirect to('/success.html')
  end

  get '/idea/:id.html' do
    @idea = Idea.get(params[:id])
    erb :"idea_view.html"
  end
  # static pages at end

  get '/:static_page.html' do
    url="#{params[:static_page]}.html".to_sym
    erb url
  end