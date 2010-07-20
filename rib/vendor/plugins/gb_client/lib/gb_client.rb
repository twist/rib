# GbClient

require 'httpclient'
require 'nokogiri'


class GbClient

  def search_by_isbn(isbn)

    isbn.gsub!(/-/,"")
    client = HTTPClient.new
    html = client.get "http://books.google.com/books/feeds/volumes?q=#{isbn}&prettyprint=true"
    data = Hash.from_xml html.body.content

    data['feed']['entry'] 

  end


end
