# Rack::Woothee

Rack::Request extension for handling User-Agent.  
Thanks to [woothee](https://github.com/woothee/woothee-ruby), Rack::Woothee supports various User-Agents.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-woothee'
```

## Usage

### Rails

If you bundle "rack-woothee", Rack::Woothee will be automatically inserted when started.  
Additional methods for `request` will be available with no cost.

```ruby
class ApplicationController < ActionController::Base
  before_action :set_request_variant

  def index
    request.user_agent       #=> "Mozilla/5.0 (Macintosh; ..."
    request.device_type      #=> :pc
    request.os               #=> "Mac OSX"
    request.browser          #=> "Chrome"
    request.from_pc?         #=> true
    request.from_smartphone? #=> false
  end

  private

  # It is useful for Action Pack variants, which is new feature from Rails 4.1.
  # You can switch view templates by +pc or +smartphone in file name.
  # http://guides.rubyonrails.org/4_1_release_notes.html#action-pack-variants
  def set_request_variant
    request.variant = request.device_type # :pc, :smartphone
  end
end
```

### Sinatra

You can also manually use Rack::Woothee for any Rack apps.

```ruby
require "sinatra"
require "rack/woothee"

configure do
  use Rack::Woothee
end

get "/" do
  request.user_agent       #=> "Mozilla/5.0 (Linux; Android 4.3; Nexus 7 ..."
  request.device_type      #=> :smartphone
  request.os               #=> "Android"
  request.os_version       #=> "4.3"
  request.browser          #=> "Chrome"
  request.browser_version  #=> "29.0.1547.72"
  request.from_smartphone? #=> true
end
```

## Available Methods

### Attributes
- request.device\_type
- request.os
- request.os\_version
- request.browser
- request.browser\_version
- request.browser\_vendor

### Helpers
- request.from\_pc?
- request.from\_smartphone?
- request.from\_mobilephone?
- request.from\_appliance?
- request.from\_crawler?

## License

MIT License
