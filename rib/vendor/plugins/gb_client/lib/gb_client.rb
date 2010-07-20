# GbClient

require 'httpclient'
require 'nokogiri'


class GbClient

  def search_by_isbn(isbn)

    isbn.gsub!(/-/,"")
    client = HTTPClient.new
    html = client.get "http://books.google.com/books/feeds/volumes?q=#{isbn}&prettyprint=true"
    data = Hash.from_xml html.body.content

    parse_data(data)

  end

  def parse_data(data)

    h = Hash.new
    entry = data["feed"]["entry"]
    puts entry.inspect
    t = ""
    h[:title] = (Array === entry["title"]? entry["title"].map{|d| t += d}.last : entry["title"])
    puts entry.keys.inspect
    h[:author] = entry["creator"]
    h[:pages] = entry['format'].first.gsub!(/[a-zA-Z]/,"")
    h[:date] = entry["date"]
    h[:isbn] = entry['identifier'].last 

    h

  end


end
