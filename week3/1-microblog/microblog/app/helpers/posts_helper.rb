module PostsHelper
  def render_all_posts(posts)
    posts.any? ? render(posts) : "No posts to display yet"
  end
end
