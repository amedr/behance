require 'spec_helper'

describe Behance::Client::Fields do

  before(:all) do
    @client = Behance::Client.new(access_token: "abc123")
  end

  before do
    @options = { api_key: @client.access_token }
  end

  describe "#fields" do

    before do
      stub_get("fields").with(query: @options).
        to_return(body: fixture("fields.json"))
      @fields = @client.fields
    end

    it "makes a http request" do
      a_get("fields").
        with(query: @options).should have_been_made
    end

    it "gets a fields list" do
      @fields.size.should == 6
    end

  end
end
