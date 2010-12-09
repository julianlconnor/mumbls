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
	output = "var markers = new Array();\n"
	output = output + "markers[0] = MapIconMaker.createMarkerIcon({width: 32, height: 32, primaryColor: '#2b6edf'});\n"
	output = output + "markers[1] = MapIconMaker.createMarkerIcon({width: 32, height: 32, primaryColor: '#eb3825'});\n"
	output = output + "markers[2] = MapIconMaker.createMarkerIcon({width: 32, height: 32, primaryColor: '#48e528'});\n"
	output = output + "markers[3] = MapIconMaker.createMarkerIcon({width: 32, height: 32, primaryColor: '#f8f612'});\n"
	output = output + "markers[4] = MapIconMaker.createMarkerIcon({width: 32, height: 32, primaryColor: '#ffb80c'});\n"
	
    if !housings.nil? and housings.count > 0
      marker_str = "markers: ["
      housings.each do |housing|
		case housing.category.id
			when 12
				markerval = 0
			when 13
				markerval = 1
			when 14
				markerval = 2
			when 15
				markerval = 3
			when 18
				markerval = 4
		end
        truncated_description = truncate(housing.description,:length => 45)
        if !housing.housing_images.nil?
          marker_str = marker_str + "{ icon: { image: markers[#{markerval}]['image'], iconsize: [32, 32], iconanchor: [18,32], infowindowanchor: [18, 0] }, address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',html: '<strong>#{link_to(housing.title,housing)}</strong> - $#{housing.price} <br /> #{truncated_description} <br /><center> #{image_tag(housing.housing_images.first.photo.url(:small))} </center>'},"
        else
          marker_str = marker_str + "{ icon: { image: markers[#{markerval}]['image'], iconsize: [32, 32], iconanchor: [18,32], infowindowanchor: [18, 0] }, address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',html: '<strong>#{link_to(housing.title,housing)}</strong> - $#{housing.price} <br /> #{truncated_description} <br />images.first.photo.url(:small))}'},"
        end
      end
      marker_str = marker_str.chop
      marker_str = marker_str + "]"
      output + "$(function() { $('#map').gMap({#{marker_str}, zoom: 15 }); });"
    else
      "$(function() { $('#map').gMap({ address: '15th St & RPI Walk over Bridge',zoom: 15 }); });"
    end
  end
  
  
end
