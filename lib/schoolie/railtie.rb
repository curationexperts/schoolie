# frozen_string_literal: true

# lib/railtie.rb
require "schoolie"
require "rails"

module Schoolie
  # Grabs the rake task and makes it available to rails
  class Railtie < Rails::Railtie
    railtie_name :schoolie

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
