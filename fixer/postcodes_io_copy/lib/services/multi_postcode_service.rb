require 'httparty'
require 'json'

class MultiPostcodesService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_multiple_postcodes(postcodes_array)
    JSON.parse(self.class.post("/postcodes", body: { "postcodes" => postcodes_array}).body)
  end

end

call = MultiPostcodesService.new
p call.get_multiple_postcodes(["ch49pf", "sy233th"])
