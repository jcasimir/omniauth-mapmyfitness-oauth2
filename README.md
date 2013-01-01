# OmniAuth MapMyFitness

This gem contains the MapMyFitness strategy for OmniAuth.

MapMyFitness currently uses OAuth 1.0.  For more information about integrating with MapMyFitness, here are a few things to check out:

- Overview: http://www.mapmyfitness.com/developer/
- Request an API Key: https://www.mapmyfitness.com/developer/api_keys/list/.
- API 3.1 Docs: http://api.mapmyfitness.com/3.1/

## Before You Begin

This will only be useful if you're using OmniAuth in your app.  Check out https://github.com/intridea/omniauth for more.

## Using This Strategy

First, add this to your `Gemfile`:

```ruby
gem 'omniauth-mapmyfitness'
```

If you need to use the latest HEAD version, you can do so with:

```ruby
gem 'omniauth-mapmyfitness', :github => 'yeeland/omniauth-mapmyfitness'
```

Next, configure OmniAuth to use this provider. For a Rails app using only OmniAuth, your `config/initializers/omniauth.rb` file should be something like:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mapmyfitness, "CONSUMER_KEY", "CONSUMER_SECRET"
end
```

## Using This Strategy with Devise

If you are using [Devise with OmniAuth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview), your `config/initializers/devise.rb` should look something like:

```ruby
Devise.setup do |config|
  # Other config options
  config.omniauth :mapmyfitness, 'CONSUMER_KEY', 'CONSUMER_SECRET', :strategy_class => OmniAuth::Strategies::MapMyFitness
end
```

## Auth Hash

Here's an example *Auth Hash* that you will get through `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'mapmyfitness',
  :uid => '1234567890',
  :info => {
    :nickname => 'notarealusername',
    :email => 'runforthehills@mapmyfitness.com',
    :name => 'Joe Marathon',
    :first_name => 'Joe',
    :last_name => 'Marathon',
    :image => 'http://api.mapmyfitness.com/3.1/users/get_avatar?uid=1234567',
    :urls => { :mapmyfitness => 'http://www.mapmyfitness.com/profile/runforthehills' },
    :location => 'Austin, TX'
  },
  :credentials => {
    :token => 'TOKEN',
    :secret => 'SECRET',
    :expires_at => nil,
    :expires => false
  },
  :extra => {
    :raw_info => {
      "user_id" => '1234567890',
      "username" => 'notarealusername',
      # There is more here. Check out http://api.mapmyfitness.com/3.1/users/get_user?doc for full output.
    }
  }
}
```

It may be worth noting that the raw_info you get back is rather large and if you are using cookie-based sessions and if you try storing `request.env['omniauth.auth']` in your session as-is, it will likely exceed the maximum session size.



## A Small Note on Branding

MapMyFitness should be [stylized](http://www.mapmyfitness.com/brand/) as MapMyFitness instead of MapMyFITNESS, Mapmyfitness, Map My Fitness, or any other variations.  To accommodate this, you may want to [configure your Devise views](https://github.com/plataformatec/devise#configuring-views) changing the omniauthable part of your `app/views/devise/_links.erb` from:
```ruby
<%= link_to "Sign in with #{provider.to_s.titleize}", omniauth_authorize_path(resource_name, provider) %><br />
```
to
```ruby
<%= link_to "Sign in with #{OmniAuth::Utils.camelize provider.to_s}", omniauth_authorize_path(resource_name, provider) %><br />
```

## License

Copyright (c) 2012-2013 by MapMyFitness. Originally maintained by Yeeland Chen.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.