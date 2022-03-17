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

  class Foo
    include ActionView::Helpers::TagHelper
    include SchoolieHelper
  end

  # rubocop: disable Metrics/MethodLength
  def test_has_a_helper_and_it_escapes_html
    obj = Minitest::Mock.new
    obj.expect(:title, "title")
    obj.expect(:creator, ["creator", "another_creator"])
    obj.expect(:abstract, "abstract")
    obj.expect(:submitting_type, "submitting_type")
    obj.expect(:degree_awarded, "<&*éüç")

    f = Foo.new
    r = f.schoolie_tags(obj, "test/fixtures/schoolie.yml")
    refute_empty r
    expected = <<~TAGS
      <meta name="Institution" value="Emory &amp; University">
      <meta name="Title" value="title">
      <meta name="Author" value="creator">
      <meta name="Author" value="another_creator">
      <meta name="Abstract" value="abstract">
      <meta name="Type" value="submitting_type">
      <meta name="Date" value="&lt;&amp;*éüç">
    TAGS
    assert_equal expected.strip, r
  end
  # rubocop: enable Metrics/MethodLength

  def test_doesnt_blow_up_on_missing_method
    obj = Object.new
    assert_equal "<meta name=\"Institution\" value=\"Emory &amp; University\">",
                 Foo.new.schoolie_tags(obj, "test/fixtures/schoolie.yml").strip
  end
end
