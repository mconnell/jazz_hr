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

    def initialize(attributes)
    end
  end
end
