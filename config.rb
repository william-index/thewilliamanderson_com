
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true

# syntax highlighting
activate :rouge_syntax

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets


end

activate :disqus do |d|
  d.shortname = 'thewilliamanderson' # Replace with your Disqus shortname.
end

activate :blog do |blog|
  blog.layout = "blog_post"
  blog.sources = "blog/{year}/{title}.html"
  blog.permalink = "blog/{title}.html"
end
