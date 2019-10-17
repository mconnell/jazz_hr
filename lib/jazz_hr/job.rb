module JazzHR
  class Job
    def self.search(client:)
      response = client.get(path: "/jobs")
      if response.is_a? Array
        response.map do |job_attributes|
          new(job_attributes)
        end
      else
        [new(response)]
      end
    end

    def self.find(client:, id:)
      raise Error.new("No job ID supplied") if id.nil?

      job_attributes = client.get(path: "/jobs/#{id}")
      return nil if job_attributes["id"] != id

      new(job_attributes)
    end

    attr_accessor :id, :team_id, :title, :country_id, :city, :state, :zip,
                  :department, :description, :minimum_salary, :maximum_salary,
                  :notes, :original_open_date, :type, :status,
                  :send_to_job_boards, :hiring_lead, :board_code,
                  :internal_code, :questionnaire, :job_applicants

    def initialize(attributes)
      attributes.each do |attribute, value|
        self.send("#{attribute}=", value)
      end
    end

  end
end
