# Tarteaucitron

A gem to install tarteaucitron, GeoIP and provide helpers to show social network buttons. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tarteaucitron'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tarteaucitron

## Usage

Run the generator to import tarteaucitron and geodat in your public directory

```ruby
rails g tarteaucitron
```

## Helpers

### Google analytics

Put this in your application layout or elsewhere

```ruby
<%= tarteaucitron({"google" => "UA-XXXXXX-XX"}) %>
```

### Google +

Expect an hash of options. Default options are 

```ruby
<%= {size: "small", annotation: "inline", width: "300"} %>
```

Example : 

```ruby
<%= tarteaucitron({"googleplus" => {size: "tall", annotation: "inline", width: "300"}}) %>
```

Here's its helper

```ruby
<%= googleplus %>
```

### Facebook

Expect an hash of options. Default options are 

```ruby
<%= {layout: "standard", action: "like", share: "true"} %>
```

Example : 

```ruby
<%= tarteaucitron({"facebook" => {layout: "box_count", action: "like", share: "true"}}) %>
```

Here's its helper

```ruby
<%= facebook %>
```

### Twitter

Expect an hash of options. Default options are 

```ruby
<%= {via: "twitter_username", count: "vertical", dnt: "true"} %>
```

Example : 

```ruby
<%= tarteaucitron({"facebook" => {via: "twitter_username", count: "horizontal", dnt: "true"}}) %>
```

Here's its helper

```ruby
<%= twitter %>
```

[See all options on tarteaucitron](https://opt-out.ferank.eu/fr/install/)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tarteaucitron/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
