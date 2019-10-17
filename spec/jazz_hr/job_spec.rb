RSpec.describe JazzHR::Job do
  let(:client) { JazzHR::Client.new(api_key: "fake-api-key") }

  describe ".search", :vcr do
    context "single job listing in the account" do
      it "returns an array containing a single job instance" do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.first).to be_a(JazzHR::Job)
        expect(jobs.length).to eq(1)
      end
    end

    context "multiple job listings in the account" do
      it "returns an array containing a multiple job instances" do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.length).to eq(2)
      end
    end

    context "zero job listings in the account" do
      it "returns an array containing a multiple job instances" do
        jobs = JazzHR::Job.search(client: client)
        expect(jobs.length).to eq(0)
      end
    end

    context "invalid api key" do
      it "raises a JazzHR::Error stating the key is invalid" do
        expect {
          JazzHR::Job.search(client: client)
        }.to raise_error(JazzHR::Error, "invalid api key")
      end
    end
  end

  describe ".find", :vcr do
    context "no job id supplied" do
      it "raises an error" do
        expect {
          JazzHR::Job.find(client: client, id: nil)
        }.to raise_error(JazzHR::Error, "No job ID supplied")
      end
    end

    context "invalid job id supplied" do
      it "returns nil" do
        expect(JazzHR::Job.find(client: client, id: 'invalid')).to be_nil
      end
    end

    context "valid job id supplied" do
      it "returns a job" do
        expect(
          JazzHR::Job.find(
            client: client,
            id: 'job_20191017201346_RS8OXHY7X8MA9GO8'
          )
        ).to be_a(JazzHR::Job)
      end

      it "populates the job instance with attribute data from the request" do
          job = JazzHR::Job.find(
            client: client,
            id: 'job_20191017201346_RS8OXHY7X8MA9GO8'
          )

          expect(job.id).to eq('job_20191017201346_RS8OXHY7X8MA9GO8')
          expect(job.team_id).to eq('')
          expect(job.title).to eq('Sample Job')
          expect(job.country_id).to eq('United Kingdom')
          expect(job.city).to eq('')
          expect(job.state).to eq('')
          expect(job.zip).to eq('')
          expect(job.department).to eq('')
          expect(job.description).to eq('<p><strong>Sample&nbsp;</strong><em>description.</em></p>')
          expect(job.minimum_salary).to eq('0')
          expect(job.maximum_salary).to eq('0')
          expect(job.notes).to eq('')
          expect(job.original_open_date).to eq('2019-10-17')
          expect(job.type).to eq('Seasonal')
          expect(job.status).to eq('Drafting')
          expect(job.send_to_job_boards).to eq('No answer')
          expect(job.hiring_lead).to eq('usr_20191017145042_SMQGZJGMGYWZCK9B')
          expect(job.board_code).to eq('gHvkRaBteh')
          expect(job.internal_code).to eq('ABC-X1')
          expect(job.questionnaire).to eq('0')
          expect(job.job_applicants).to eq([])
      end
    end
  end
end
