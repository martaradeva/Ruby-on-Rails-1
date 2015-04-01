# blog_website.rb

# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require './post.rb'
Bundler.require(:default)

# TODO:
# - get '/' - Display a view of all posts.
# + get '/new' - Displays a view for creating a new post.
# - post '/new' - Creates a new post.
# - get '/42' - Displays a view of the post with id equal to 42.
# - delete '/42' - Deletes the post with id equal to 42.

# + 404
# + Empty index page
# - Blog post validation length

class BlogApp < Sinatra::Application

  @@posts = {}

  before do
    content_type :html
  # @ideas = Idea.all
  # @header = File.read('./views/header.html')
  # @idea = Idea.new
  # @date_format = "%m/%d/%Y at %I:%M"
  end

  get '/' do
    erb :"index.html", locals: { posts: @@posts }
  end

  get '/new' do
    erb :"new.html"
  end

  post '/new' do
    post = Post.new(params["title"], params["content"])
    @@posts.empty? ? post_id = 0 : post_id = @@posts.keys.last + 1
    # tova vse oshte gyrmi :(
    # post_id = @@posts.keys.last + 1 || 0
    @@posts[post_id] = post
    # p @@posts
    redirect to("/")
  end

  get '/404' do
    erb :"404.html" 
  end

  get '/:id' do
    @post = @@posts[:id] # find by id
    if @post 
    then erb :"show.html"
    else redirect to("/404") # or 404 if id not present
    end
  end

  delete '/:id' do
    @@posts.delete(:id)
    redirect to("/")
  end

end

