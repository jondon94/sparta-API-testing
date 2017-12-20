require_relative 'services/single_postcode_service.rb'
require_relative 'services/multi_postcode_service.rb'

class Postcodesio

  def single_postcode_service
    SinglePostcodesService.new
  end

  def multi_postcode_service
    MultiPostcodesService.new
  end

end
