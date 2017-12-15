require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    postcodes_array = ['ch49pf', 'sy233th']

    before(:all) do
      @postcodesio = Postcodesio.new.multi_postcode_service
      @postcodesio.get_multiple_postcodes(postcodes_array)
    end

    it "shuld loop through both codes and confirm 23 keys for results" do
      expect(@postcodesio.get_multiple_postcodes_result.length).to eq(23)      
    end

  end
end
