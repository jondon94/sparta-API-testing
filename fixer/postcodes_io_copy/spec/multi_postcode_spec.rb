require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    postcodes_array = ['ch49pf', 'sy233th']

    before(:all) do
      @postcodesio = Postcodesio.new.multi_postcode_service
      @postcodesio.get_multiple_postcodes(postcodes_array)
    end

    it "should have 23 individual results for each postcode" do
        expect(get_multiple_postcodes_result.length).to eq(23)
    end

  end
end
