# ZapiApp

This gem allows you to easily and quickly leverage [Zapi](https://www.zapi.app/) features into your Ruby project.

## Installation

Add this line to your Gemfile and run `bundle`:

```ruby
gem 'zapi_app', :git => 'git://github.com/lewaabahmad/zapi.rb'
```

Please note that this gem will be migrated to RubyGems upon the release of version 1.0.0 whereby you will also be able to install it yourself via:

```bash
$ gem install zapi_app
```

## Usage

Currently, this gem only provides functionality for the fetching of model instances.

The ids of instances and models can be gleamed from [the app](https://www.zapi.app/).

###Fetch an individual instance of a model via:

```ruby
ZapiApp::Model.fetch({ instance_id: <INSTANCE_ID> })
```

###Fetch all instances of a model via:

```ruby
ZapiApp::Set.fetch({ model: <MODEL_ID> })
```

## Contributing

Make a pull request :)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
