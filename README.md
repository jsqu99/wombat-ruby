# Wombat::Ruby

Ruby API client for pushing objects to [Wombat](https://my.wombat.co)

## Installation

Add this line to your application's Gemfile:

    gem 'wombat-ruby', github: 'wombat/wombat-ruby', require: 'wombat'

And then execute:

    $ bundle

## Usage

Add your Wombat credentials to `config/initializers/wombat.rb`:

```ruby
Wombat.configure do |config|
  config.connection_token = "YOUR TOKEN"
  config.connection_id = "YOUR CONNECTION ID"
end
```

You can now send json payload objects to Wombat by calling:

```ruby
Wombat::Client.push(json_payload)
```

## Use console

You can also use the console to debug or test pushing objects.

Start the console like this:

```shell
bundle exec bin/console
```

In the console you will have to setup your credentials, then you can push json objects like this:

```ruby
Wombat.configure do |config|
  config.connection_token = "YOUR TOKEN"
  config.connection_id = "YOUR ID"
end

pirate_payload = %{{"pirates": [{"id": "1", "name": "Blackbeard"}]}}

Wombat::Client.push(pirate_payload)
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/wombat-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


![Wombat Logo](http://spreecommerce.com/images/wombat_logo.png)

This gem is 100% open source an licensed under the terms of the New BSD License.
