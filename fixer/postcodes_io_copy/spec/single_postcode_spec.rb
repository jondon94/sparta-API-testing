require 'spec_helper'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcodesio = Postcodesio.new.single_postcode_service
      @postcodesio.get_single_postcode("ch49pf")
    end

    it "should respond with a status code message of 200" do
      expect(@postcodesio.get_status_code_from_body_response).to eq 200
    end

    it "should respond with a hash of results" do
      expect(@postcodesio.get_result).to be_kind_of(Hash)
    end

    it "should have a integr value for the quality param" do
      expect(@postcodesio.get_result_of_quality).to be_kind_of(Integer)
    end

    it "should have a quality param between 1 and 9" do
      expect(@postcodesio.get_result_of_quality).to be_between(1,9)
    end

    it "should show the postcode as the first result" do
      expect(@postcodesio.get_postcode).to eq 'CH4 9PF'
    end

    it "should have a value as in integer for the eastings param" do
      expect(@postcodesio.get_single_postcode_eastings).to be_kind_of(Integer)
    end

    it "should have a value as in integer for the northings param" do
      expect(@postcodesio.get_single_postcode_northings).to be_kind_of(Integer)
    end

    it "should have a string for specifiying the country" do
      expect(@postcodesio.get_single_postcode_country).to be_kind_of(String)
    end
    #
    # it "should belong to a post code within 1 of the 4 countries of the uk" do
    #   expect(@pcode.get_single_postcode(a)['result']['country']).to include ('Wales' || 'England' || 'Scotland' || 'Northern Ireland')
    # end
    #
    # it "should have a string for specifiying the local health board" do
    #   expect(@pcode.get_single_postcode(a)['result']['nhs_ha']).to be_kind_of(String)
    # end
    #
    # it "should have a value as in integer for the longitude param" do
    #   expect(@pcode.get_single_postcode(a)['result']['longitude']).to be_kind_of(Float)
    # end
    #
    # it "should have a value as in integer for the latitude param" do
    #   expect(@pcode.get_single_postcode(a)['result']['latitude']).to be_kind_of(Float)
    # end
    #
    # it "should have a string for specifiying the european electoral reigon" do
    #   expect(@pcode.get_single_postcode(a)['result']['european_electoral_region']).to be_kind_of(String)
    # end
    #
    # it "should have a string for specifiying the primary health board" do
    #   expect(@pcode.get_single_postcode(a)['result']['primary_care_trust']).to be_kind_of(String)
    # end
    #
    # it "should have a null value for the reigon as this param was abolished in 2011" do
    #   expect(@pcode.get_single_postcode(a)['result']['region']).to eq nil
    # end
    #
    # it "should have a lsoa that is a string that conatins numbers (ie. string)" do
    #   expect(@pcode.get_single_postcode(a)['result']['lsoa']).to be_kind_of(String)
    # end
    #
    # it "should have a msoa that is a string that conatins numbers (ie. string)" do
    #   expect(@pcode.get_single_postcode(a)['result']['msoa']).to be_kind_of(String)
    # end
  end
end
