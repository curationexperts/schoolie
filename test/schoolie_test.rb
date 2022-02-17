# frozen_string_literal: true

require "test_helper"

class SchoolieTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Schoolie::VERSION
  end

  def test_it_has_a_version
    assert_match(/\d+\.\d+\.\d+/, Schoolie::VERSION)
    refute_nil Schoolie::VERSION
  end
end
