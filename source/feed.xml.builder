xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "William Anderson"
  xml.subtitle "Blog"
  xml.id "http://williamanderson.io/weeklies.html"
  xml.link "href" => "http://williamanderson.io/weeklies.html"
  xml.link "href" => "http://williamanderson.io/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "William Anderson" }

  data.weeklies.each do |article|
     xml.entry do
       xml.title article.title
       xml.link "rel" => "alternate", "href" => article.url
       xml.id article.url
       xml.published article.machine_date.to_time.iso8601
       xml.updated article.machine_date.to_time.iso8601
       xml.author { xml.name "William Anderson" }
       xml.summary article.summary, "type" => "html"
       xml.content article.title+" "+article.url, "type" => "html"
   end
 end
end
#  @see https://forum.middlemanapp.com/t/creating-an-rss-xml-feed/34
