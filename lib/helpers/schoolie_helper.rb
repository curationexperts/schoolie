# frozen_string_literal: true

require "yaml"
# A simple helper that creates <meta> tags required for google scholar information.
# The default configuration attempts to load from Rails.root/config/schoolie.yml,
# though can be overridden
module SchoolieHelper
  def schoolie_tags(concern, config = Rails.root.join("config/schoolie.yml"))
    m = load_map(config)
    tags = m["static"].map do |k, v|
      tag.meta(name: k, value: v)
    end
    tags << m["attributes"].map do |k, v|
      tag.meta(name: k, value: concern.send(v))
    rescue StandardError
      warn("Undefined attribute mapping: #{k} -> #{v}")
    end
    tags.join("\n")
  end

  private

  def load_map(config)
    @load_map ||= YAML.safe_load(File.open(config, "r"), [Symbol])
  end
end
