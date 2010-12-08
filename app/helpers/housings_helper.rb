module HousingsHelper
  def show_housing_listing(address)
    "$(function() { 
                        $('#map').gMap({ markers: [{ address: '#{address}',
                                                      html: '<b>#{address}</b>' }],
                                          address: '#{address}',
                                          zoom: 15 }); 
                    });"
  end
  
  def show_all(housings)
    if !housings.nil? and housings.count > 0
      marker_str = "markers: ["
      housings.each do |housing|
        truncated_description = truncate(housing.description,:length => 45)
        if !housing.housing_images.nil?
          marker_str = marker_str + "{ address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',html: '<strong>#{link_to(housing.title,housing)}</strong> - $#{housing.price} <br /> #{truncated_description} <br /><center> #{image_tag(housing.housing_images.first.photo.url(:small))} </center>'},"
        else
          marker_str = marker_str + "{ address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',html: '<strong>#{link_to(housing.title,housing)}</strong> - $#{housing.price} <br /> #{truncated_description} <br />images.first.photo.url(:small))}'},"
        end
      end
      marker_str = marker_str.chop
      marker_str = marker_str + "]"
      "$(function() { $('#map').gMap({#{marker_str}, zoom: 15 }); });"
    else
      "$(function() { $('#map').gMap({ address: '15th St & RPI Walk over Bridge',zoom: 15 }); });"
    end
  end
  
  
end
