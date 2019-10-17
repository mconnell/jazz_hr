module JazzHR
  class Job
    def self.search(client:)
      response = client.get(path: "/jobs")
      if response.is_a? Array
        response.map do |job_attributes|
          self.new(job_attributes)
        end
      else
        [self.new(response)]
      end
    end

    def initialize(attributes)
    end
  end
end
