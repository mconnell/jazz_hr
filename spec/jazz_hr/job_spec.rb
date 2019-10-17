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

  describe ".find" do
    context "no job id supplied" do
      it "raises an error" do
        expect {
          JazzHR::Job.find(client: client, id: nil)
        }.to raise_error(JazzHR::Error, "No job ID supplied")
      end
    end

    context "invalid job id supplied" do
      it "returns nil", :vcr do
        expect(JazzHR::Job.find(client: client, id: 'invalid')).to be_nil
      end
    end

    context "valid job id supplied" do
      it "returns a job", :vcr do
        expect(JazzHR::Job.find(client: client, id: 'job_20191017201346_RS8OXHY7X8MA9GO8')).to be_a(JazzHR::Job)
      end
    end
  end
end
