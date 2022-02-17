# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start
  require "coveralls"
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "schoolie"

require "minitest/autorun"
