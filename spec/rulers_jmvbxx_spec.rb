# frozen_string_literal: true

RSpec.describe RulersJmvbxx do
  let(:app) { RulersJmvbxx::Application.new }
  let(:env) { { "REQUEST_METHOD" => "GET", "PATH_INFO" => "/test" } }
  let(:response) { app.call(env) }
  let(:status) { response[0] }
  let(:body) { response[2][0] }

  it "has a version number" do
    expect(RulersJmvbxx::VERSION).not_to be nil
  end

  it "returns http success" do
    expect(status).to eq 200
  end

  it "returns body" do
    expect(body).to eq "test file"
  end
end
