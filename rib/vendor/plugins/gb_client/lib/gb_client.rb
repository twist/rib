# GbClient

require 'httpclient'
require 'nokogiri'


class GbClient

  #
  #
  # searches books.google.com for books by isbn.
  #
  # returns either a hash, or
  # if given an *object* providing a
  # *from_hash(hash)* method will fill
  # it with the data.
  # the object members must be named like the 
  # keys in the hash.
  #
  #
  def search_by_isbn(isbn, object = nil)

    return nil if (isbn = isbn.gsub!(/-/,"")).nil?
    client = HTTPClient.new
    html = client.get "http://books.google.com/books/feeds/volumes?q=#{isbn}&prettyprint=true"
    data = Hash.from_xml html.body.content

    entry = parse_data(data)
    if !object.nil? and object.respond_to? :from_hash
      object.from_hash(entry)
      object
    else
      entry
    end

  end

  def parse_data(data)

    h = Hash.new
    return if (entry = data["feed"]["entry"]).nil?
    t = ""
    h[:title] = ( (!entry.nil?  and Array) === entry["title"]? entry["title"].map{|d| t += d}.last : entry["title"])
    puts entry.keys.inspect
    h[:author] = entry["creator"]
    h[:pages] = entry['format'].first.gsub!(/[a-zA-Z]/,"")
    h[:date] = entry["date"]
    h[:isbn] = entry['identifier'].last 

    h

  end


end
