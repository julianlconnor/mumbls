module HousingsHelper
  def show_housing_listing(address)
    "$(function() { 
                        $('#map').gMap({ markers: [{ address: '#{address}',
                                                      html: '#{address}' }],
                                          address: '#{address}',
                                          zoom: 15 }); 
                    });"
  end
  
  def show_all(housings)
    if !housings.nil? and housings.count > 0
      marker_str = "markers: ["
      housings.each do |housing|
        truncated_description = truncate(housing.description,:length => 45)
        marker_str = marker_str + "{ address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',html: '<span>#{housing.title} - $#{housing.price} ~ #{truncated_description}</span>'},"
      end
      marker_str = marker_str.chop
      marker_str = marker_str + "]"
      "$(function() { $('#map').gMap({#{marker_str}, zoom: 15 }); });"
    else
      "$(function() { $('#map').gMap({ address: '15th St & RPI Walk over Bridge',zoom: 15 }); });"
    end
  end
  
  
end
