require 'httparty'
require 'json'

class SinglePostcodesService
  include HTTParty

  attr_accessor :single_postcode_data

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single_postcode_data = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_result
    @single_postcode_data['result']
  end

  def get_status_code_from_body_response
    @single_postcode_data['status']
  end

  def get_result_of_quality
    get_result['quality']
  end

  def get_postcode
    get_result.first[1]
  end

  def get_single_postcode_eastings
    get_result['eastings']
  end

  def get_single_postcode_northings
    get_result['northings']
  end

  def get_single_postcode_country
    get_result['country']
  end
end

call = SinglePostcodesService.new
# p call.get_single_postcode("ch49pf")
