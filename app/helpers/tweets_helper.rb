module TweetsHelper
  #convert the plain links into HTML anchor links (with <a> tags) and return the string back
  #uses String's gsub method for regular expression
  def display_content_with_links(text)
     text.gsub(/(http:\/\/[a-zA-Z0-9\/\.\+\-_:?&=]+)/) {|a| "<a href=\"#{a}\" target='_blank'>#{a}</a>"}
      linked = text.gsub( %r{http://[^\s<]+} ) do |url|
         puts url.inspect
      end
  end
	 

end
