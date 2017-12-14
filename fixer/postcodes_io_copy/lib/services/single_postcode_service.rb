require 'httparty'
require 'json'

class SinglePostcodesService
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

end

call = SinglePostcodesService.new
p call.get_single_postcode("ch49pf")
