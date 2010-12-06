module HomeHelper
  def show_all(housings)
    if !housings.nil?
      marker_str = "markers: ["
      housings.each do |housing|
        truncated_description = truncate(housing.description,:length => 45)
        marker_str = marker_str + "{ address: '#{housing.address},#{housing.city},#{housing.state},#{housing.zip_code}',
                                     html: '<b>#{housing.title} - $#{housing.price} ~ #{truncated_description}</b>'
                                   },"
      end
      marker_str = marker_str.chop
      marker_str = marker_str + "]"
      "$(function() { $('#map').gMap({#{marker_str}, zoom: 15 }); });"
    else
      "$(function() { $('#map').gMap(); });"
    end
  end
end
