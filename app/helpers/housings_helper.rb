module HousingsHelper
  def show_map(address)
    "$(function() { 
        $('#map').gMap({ markers: [{ address: '#{address}',
                                      html: '#{address}' }],
                          address: '#{address}',
                          zoom: 15 }); 
    });"
  end
end
