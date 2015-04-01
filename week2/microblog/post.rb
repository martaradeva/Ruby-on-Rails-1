class Post
  attr_accessor :title, :content

  def initialize(title, content) #(title: 'default blog post', content: 'Hello World')
    @title = title
    @content = content
  end
end
