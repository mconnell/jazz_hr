# JazzHR

Ruby interface to the [JazzHR API](http://www.resumatorapi.com/v1/).

## Installation

This gem can be found on [RubyGems.org](https://rubygems.org/gems/jazz_hr)

Add this line to your application's Gemfile:

```ruby
gem 'jazz_hr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jazz_hr

## Usage

Still fleshing this out... At the moment, a basic client can be invoked with the following:

```ruby
  # Instanciate a client object using your JazzHR API key
  client = JazzHR::Client.new(api_key: "my-valid-api-key")

  # Find a specific job by ID
  JazzHR::Job.find(client: client, id: "job_id_abc123")

  # Search all jobs
  JazzHR::Job.search(client: client)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mconnell/jazz_hr.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
