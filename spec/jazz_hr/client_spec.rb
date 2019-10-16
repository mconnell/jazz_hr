RSpec.describe JazzHR::Client do
  describe "constants" do
    it "defines a BASE_URI for the client" do
      expect(described_class::BASE_URI).to(
        eq("https://api.resumatorapi.com/v1")
      )
    end
  end

  describe "new client instance" do
    subject(:client) { described_class.new(api_key: "fake-api-key") }

    it "provides an interface to invoke GET requests against the API", :vcr do
      response = client.get(path: "/jobs")
      expect(response).to eq({
        "id"                 => "job_20191016193456_XGSWRU2DDZPU9Y2T",
        "team_id"            => "",
        "title"              => "Sample Job",
        "country_id"         => "United States",
        "city"               => "Pittsburgh",
        "state"              => "PA",
        "zip"                => "15212",
        "department"         => "",
        "description"        => "<p>HTML description</p>",
        "minimum_salary"     => "0",
        "maximum_salary"     => "0",
        "notes"              => "",
        "original_open_date" => "2019-10-16",
        "type"               => "Full Time",
        "status"             => "On Hold",
        "send_to_job_boards" => "No answer",
        "hiring_lead"        => "usr_20191016193456_DWYSYV1EX9WMEFZX",
        "board_code"         => "X8P7SBPn4N",
        "internal_code"      => "",
        "questionnaire"      => "0"
      })
    end
  end
end
