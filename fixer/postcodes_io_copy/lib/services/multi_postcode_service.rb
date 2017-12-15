require 'httparty'
require 'json'

class MultiPostcodesService
  include HTTParty

  attr_accessor :multi_postcode_data

  base_uri 'https://api.postcodes.io'

  def get_multiple_postcodes(postcodes_array)
    @multi_postcode_data = JSON.parse(self.class.post("/postcodes", body: { "postcodes" => postcodes_array}).body)
  end

  def get_multiple_postcodes_result
    @multi_postcode_data['result']['result']
  end


end

call = MultiPostcodesService.new
# p call.get_multiple_postcodes(["ch49pf", "sy233th"])
