# Chartism

[![Dependency Status](https://gemnasium.com/Darksecond/chartism.svg)](https://gemnasium.com/Darksecond/chartism)

This library is designed for making charts with ease. It provides a clean DSL to describe charts.
It is base on the great chartist.js library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chartism'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chartism

Add to your `application.js`

```
//= require chartist
```

And add to your `application.css`

```
*= require chartist.min
```

## Usage

An example Linechart Model

```ruby
class ExampleLineChart
  include Chartism::Line

  def initialize
    @area = true
  end

  options do
    points false
    smooth false

    area do
      @area
    end
  end

  labels do
    %w(Mon Tue Wed Thu Fri)
  end

  series do
    [5, 2, 4, 2, 0]
  end

  series do
    [6, 3, 1, 2, 4]
  end
end
```

Then use the following in a view:

```erb
<%= chart ExampleLineChart.new, class: ['ct-perfect-fourth'] %>
```

`ExampleLineChart.new` should preferbly be in a controller or other model.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment. 

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/darksecond/chartism/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
