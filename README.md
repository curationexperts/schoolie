# Schoolie
[![CircleCI](https://circleci.com/gh/curationexperts/schoolie/tree/main.svg?style=svg)](https://circleci.com/gh/curationexperts/schoolie/tree/main)
<a href="https://codeclimate.com/github/curationexperts/schoolie/maintainability"><img src="https://api.codeclimate.com/v1/badges/bc6ef5bc9e76c6c3dcc9/maintainability" /></a>
[![Coverage Status](https://coveralls.io/repos/github/curationexperts/schoolie/badge.svg?branch=main)](https://coveralls.io/github/curationexperts/schoolie?branch=main)

The gem that generates a site map and meta tags for google scholar

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

In order to map your particular metadata into the google scholar fields, create a file in Rails.root/config named schoolie.yml.


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

This will generate a sitemap in public/sitemap.txt You should refer to this file in your robots.txt 

NB. this task just uses curl to query solr currently, so make sure you have that installed first

## Development

Check out the repo, and bundle install as per normal.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/schoolie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/schoolie/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
