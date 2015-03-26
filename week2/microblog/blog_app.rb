# blog_website.rb

# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require './post.rb'
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
    @posts = {} # id => post
    content_type :html
  # @ideas = Idea.all
  # @header = File.read('./views/header.html')
  # @idea = Idea.new
  # @date_format = "%m/%d/%Y at %I:%M"
  end

  get '/' do
    erb :"index.html"
  end

  get '/new' do
    # @post = Post.new
    erb :"new.html"
  end

  post '/new' do
    post = Post.new(params[:title], params[:content])
    post_id = @posts.keys.last.to_i + 1.to_sym
    @posts[post_id] = post
    redirect to("/#{post_id}")
  end

  get '/:id' do
    # find by id
    erb :"show.html" # or 404 if id not present
  end

  post '/:id' do
    # write down and redirect to index
    # if id is bad -> render with warning "bad id"
  end

end

