RSpec.describe JazzHR::Job do
  let(:client) { JazzHR::Client.new(api_key: "fake-api-key") }

  describe ".search" do
    context "single job listing in the account" do
      it "returns an array containing a single job instance", :vcr do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.first).to be_a(JazzHR::Job)
        expect(jobs.length).to eq(1)
      end
    end

    context "multiple job listings in the account" do
      it "returns an array containing a multiple job instances", :vcr do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.length).to eq(2)
      end
    end

    context "zero job listings in the account" do
      it "returns an array containing a multiple job instances", :vcr do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.length).to eq(0)
      end
    end

    context "invalid api key" do
      it "raises a JazzHR::Error stating the key is invalid", :vcr do
        expect {
          JazzHR::Job.search(client: client)
        }.to raise_error(JazzHR::Error, "invalid api key")
      end
    end
  end
end
