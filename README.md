# Schoolie
[![CircleCI](https://circleci.com/gh/curationexperts/schoolie/tree/main.svg?style=svg)](https://circleci.com/gh/curationexperts/schoolie/tree/main)
<a href="https://codeclimate.com/github/curationexperts/schoolie/maintainability"><img src="https://api.codeclimate.com/v1/badges/bc6ef5bc9e76c6c3dcc9/maintainability" /></a>
[![Coverage Status](https://coveralls.io/repos/github/curationexperts/schoolie/badge.svg?branch=main)](https://coveralls.io/github/curationexperts/schoolie?branch=main)

A gem that generates meta tags for google scholar (or any other tags you might want)

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
  citation_institution: Your University
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

## SiteMaps

If you'd like to generate a sitemap for your Hyrax-based application, a simple rake task can be used (not included in schoolie):

```ruby
  task sitemap: :environment do
    date_field = 'system_modified_dtsi'
    result = ActiveFedora::SolrService.query("has_model_ssim:MyModel",
                                             fq: "selectin_criteria:here",
                                             fl: "id,#{date_field}",
                                             sort: "sort_field,sortfield ASC",
                                             rows: 20_000)
    ids = result.map do |x|
      ["https://etd.example.com/concern/theses/#{x['id']}", x[date_field].to_s]
    end
    builder = Nokogiri::XML::Builder.new do |sitemap|
      sitemap.urlset("xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance",
                 xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                 "xsi:schemaLocation": "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
                   ids.each { |url, date|
                     sitemap.url {
                       sitemap.loc url
                       sitemap.lastmod date
                     }
                   }
                 }
    end
    File.open(Rails.root.join("public", "sitemap.xml"), "w") { |f| f.write(builder.to_xml) }
end
```

Don't forget to add your sitemap url to robots.txt too!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/schoolie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/schoolie/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [Apache 2.0 License](https://opensource.org/licenses/Apache-2.0).
