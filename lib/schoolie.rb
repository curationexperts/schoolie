# frozen_string_literal: true

require "action_view"
require_relative "schoolie/version"
require_relative "helpers/schoolie_helper"
require "schoolie/railtie" if defined?(Rails)
ActionView::Base.include SchoolieHelper
