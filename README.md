# HotReloadProxy [![Build Status](https://travis-ci.org/buren/hot_reload_proxy.svg?branch=master)](https://travis-ci.org/buren/hot_reload_proxy) [![Code Climate](https://codeclimate.com/github/buren/hot_reload_proxy/badges/gpa.svg)](https://codeclimate.com/github/buren/hot_reload_proxy)

Stupid, stupid simple Webpack dev server proxy. It will look for the pattern `.hot-update.`, which and proxies that to the configured host and port.

:warning: This is intended for development purposes only.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hot_reload_proxy'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install hot_reload_proxy
```

## Configuration

```
HotReloadProxy::Proxy.foreign_host = 'localhost' # Default
HotReloadProxy::Proxy.foreign_port = '3100'      # Default
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hot_reload_proxy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
