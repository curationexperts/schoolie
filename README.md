# Schoolie
[![CircleCI](https://circleci.com/gh/curationexperts/schoolie/tree/main.svg?style=svg)](https://circleci.com/gh/curationexperts/schoolie/tree/main)
<a href="https://codeclimate.com/github/curationexperts/schoolie/maintainability"><img src="https://api.codeclimate.com/v1/badges/bc6ef5bc9e76c6c3dcc9/maintainability" /></a>
[![Coverage Status](https://coveralls.io/repos/github/curationexperts/schoolie/badge.svg?branch=main)](https://coveralls.io/github/curationexperts/schoolie?branch=main)

A gem that generates a site map and meta tags for google scholar (or any other tags you might want)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'schoolie'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install schoolie

## Usage

Install your schoolie configuration file in ```config/schoolie.yml```

This file should contain contents similar to this:

```
---
static:
  citation_dissertation_institution: Your University
attributes:
  citation_title: title
  citation_author: creator
  citation_date: publication_date
  citation_keywords: keywords
  citation_pdf_url: permanent_url
```

The 'static' section will be written directly into the meta tags as is, attributes will be sent as method calls to the current curation
concern object, and the value thus returned will be written into the meta tag.

Missing methods will be ignored.


```
bundle exec rails schoolie:sitemap
```

The 'static' section maps a particular meta tag name to a static string

The attributes section maps meta tag names to _methods that will be
called on whatever you pass into the ```schoolie_tags``` helper_.

If the method does not exist, the tag will not be generated (though no
error will be thrown).


Call the helper like any other helper in your view:


```erb
<%= schoolie_tags my_object %>
```
That's all there is to it!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/schoolie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/schoolie/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
