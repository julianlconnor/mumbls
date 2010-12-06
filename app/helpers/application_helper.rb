module ApplicationHelper
  def gmap_api_key
    if ENV['RAILS_ENV'] == 'development'
      "http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAKLVVXnDXLfmDJ9Z9mWFkLhS1cPgereRAtRXHgey7wSjasn3WjhQOsXSXNFZfBPPjvj6Q0a01XkpciA"
    elsif ENV['RAILS_ENV'] == 'production'
      "http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAoHnqt2XVAb7ehuW5CBUkihSGoDxeRAceqQTKQ9CLUJlEbp2NGhRnLRbHG0VdTZYtm98sYseC1gR64w"
    end
  end
end
