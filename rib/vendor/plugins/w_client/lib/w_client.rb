
require 'httpclient'
require 'nokogiri'


class WClient

  attr_accessor :access_key



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

    return nil if (isbn = isbn.gsub(/-/,"")).nil?
    @client = HTTPClient.new
    @book_hash = std_entry
    @isbn = isbn
   
    puts search_amazon.inspect
    #puts search_google_books.inspect
    #puts search_isbndb.inspect
    return
    @book_hash.merge!(search_google_books || {})
    isbndb_hash = search_isbndb
    @book_hash.each {|k,v|
     @book_hash[k] = isbndb_hash[k] if @book_hash[k].blank? 
    }


    

    if !object.nil? and object.respond_to? :from_hash
      object.from_hash(@book_hash)
      object
    else
      @book_hash
    end

  end

  attr_accessor :isbn


  def search_isbndb
    html = @client.get("http://isbndb.com/api/books.xml?access_key=#{@access_key}&index1=isbn&value1=#{@isbn}")
    data = Hash.from_xml html.body.content
    h = Hash.new
    return {} if data["ISBNdb"]["BookList"].nil?
    entry = data["ISBNdb"]["BookList"]["BookData"]
    h[:title] = entry["Title"]
    h[:author] = entry["AuthorsText"].split(",").first
    h[:isbn10] = entry["isbn"]
    h[:publisher] = entry["PublisherText"]
    h
  end

  def search_amazon
    
    #1. get a list of all matches
    html = @client.get("http://www.amazon.de/s/ref=nb_sb_noss?__mk_de_DE=%C5M%C5Z%D5%D1&url=search-alias%3Dstripbooks&field-keywords=#{@isbn}&x=0&y=0")
    # 2. get the first entry
    book_link =  html.body.content.match(/<td class="dataColumn">.*\n<a href="(.*)"><span/)[1]

    html = @client.get(book_link)

    h = Hash.new
    h[:publisher] = html.body.content.match(/<li><b>Verlag:<\/b>(.*?)<\/li>/)[1]
    h[:isbn10] = html.body.content.match(/<li><b>ISBN-10:<\/b>(.*?)<\/li>/)[1]
    h[:isbn13] = html.body.content.match(/<li><b>ISBN-13:<\/b>(.*?)<\/li>/)[1]
    h[:original_title] = html.body.content.match(/<li><b>Originaltitel:<\/b>.*?>(.*?)<\/a><\/li>/)[1]
    h[:author] = html.body.content.match(/field-author=.*?>(.*?)<\/a>/)[1]
    h
    
  end

  def search_google_books

    html = @client.get "http://books.google.com/books/feeds/volumes?q=#{@isbn}&prettyprint=true"
    data = Hash.from_xml html.body.content

    h = Hash.new
    return {} if (entry = data["feed"]["entry"]).nil?
    t = ""
    h[:title] = ( (!entry.nil?  and Array) === entry["title"]? entry["title"].map{|d| t += d}.last : entry["title"])
    h[:author] = entry["creator"]
    h[:pages] = entry['format'].first.gsub!(/[a-zA-Z]/,"")
    h[:date] = entry["date"]
    h[:isbn13] = entry['identifier'].last 

    h
  end

  def std_entry
    return {
      :title => nil,
      :author => nil,
      :pages => nil,
      :date => nil,
      :publisher => nil,
      :isbn10 => nil,
      :original_title => nil,
      :isbn13 => nil
    }
  end


end
