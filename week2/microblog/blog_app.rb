# blog_website.rb

# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

# TODO:
# get '/' - Display a view of all posts.
# get '/new' - Displays a view for creating a new post.
# post '/new' - Creates a new post.
# get '/42' - Displays a view of the post with id equal to 42.
# delete '/42' - Deletes the post with id equal to 42.

# 404
# Empty index page
# Blog post validation length

class BlogApp < Sinatra::Application

  before do
  content_type :html
  @ideas = Idea.all
  @header = File.read('./views/header.html')
  @idea = Idea.new
  @date_format = "%m/%d/%Y at %I:%M"
  end

  get '/' do
    erb :"index.html"
  end

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
end
