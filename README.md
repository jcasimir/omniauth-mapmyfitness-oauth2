# OmniAuth MapMyFitness OAuth2

This gem contains the MapMyFitness strategy for OmniAuth using OAuth2.

## Setup

### Install the Gem

Add the dependency to your application's Gemfile:

```
gem 'omniauth-mapmyfitness-oauth2'
```

### Key & Secret Variables

Your secret credentials should be stored in environment variables. You can do this in a your `.bash_profile` with the following:

```plain
export MMF_API_KEY=your_key_goes_here
export MMF_API_SECRET=your_secret_goes_here
```

#### Checking Environment Variables

Once you have those ENV variables set, you can check them from IRB:

```plain
$ irb
> ENV['MMF_API_KEY']
 => "09375ijkds9072l"
> ENV['MMF_API_SECRET']
 => "08993mhjd8721lk"
```

### Create an Initializer

Create a `config/initializers/omniauth.rb` with the following:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mapmyfitness, ENV['MMF_API_KEY'], ENV['MMF_API_SECRET']
end
```

**NOTE**: The `ENV['MMF_API_KEY']` is unsed in an unusual place in this strategy. It *must* be defined for the library to work.
