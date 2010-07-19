# GbClient

require 'httpclient'
require 'nokogiri'


class GbClient

  def search_by_isbn(isbn)
    client = HTTPClient.new
    html = client.get "http://books.google.com/books/feeds/volumes?q=9783936937732&prettyprint=true"
    puts html.body.content
    data = parse_xml(html.body.content)
    pp data


  end

  protected

  def parse_xml(src)
    xml = Nokogiri::XML::Reader(src)

    data = {}
    pp xml.attributes
    xml.each {|node|
      data[node.name.to_sym]= node.attributes
    }
    data
  end

end
