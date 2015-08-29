set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

require 'deployment'

# ignores layout for xml feed
page "/feed.xml", :layout => false

# markdown styling
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true

# syntax highlighting
activate :rouge_syntax

activate :bourbon

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

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


activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method   = :ftp
  deploy.host     = $deployment[:host]
  deploy.path     = $deployment[:path]
  deploy.user     = $deployment[:user]
  deploy.password = $deployment[:password]
end
