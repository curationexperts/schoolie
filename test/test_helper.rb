# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "schoolie"

require "minitest/autorun"
if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start
  require "coveralls"
  Coveralls.wear!
end
