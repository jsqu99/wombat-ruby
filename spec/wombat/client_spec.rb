require "spec_helper"

describe Wombat::Client do

  context "push json" do

    before do
      Wombat.configure do |config|
        config.connection_id = "123"
        config.connection_token = "token"
      end
      stub_request(:post, "https://push.wombat.co/").
        with(
          :body => "name:value",
          :headers => {
            'Content-Type'=>'application/json',
            'X-Hub-Access-Token'=>'token',
            'X-Hub-Store'=>'123',
            'X-Hub-Timestamp'=>/.*/}
        ).to_return(:status => 202, :body => "", :headers => {})
    end

    it "sends the connection_id and token as headers" do
      Wombat::Client.push("name:value")
    end

    context "with response not 202" do
      before do
        stub_request(:post, "https://push.wombat.co/").
          with(
            :body => "name:value",
            :headers => {
              'Content-Type'=>'application/json',
              'X-Hub-Access-Token'=>'token',
              'X-Hub-Store'=>'123',
              'X-Hub-Timestamp'=>/.*/}
          ).to_return(:status => 404, :body => "wombat error", :headers => {})
      end

      it "will raise PushApiException" do
        expect{ Wombat::Client.push("name:value")}.to raise_error(Wombat::Client::PushApiError, "Push not successful. Wombat returned response code 404 and message: wombat error")
      end
    end
  end

end
