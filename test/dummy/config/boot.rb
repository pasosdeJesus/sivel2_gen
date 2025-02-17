# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../../../Gemfile", __FILE__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
$LOAD_PATH.unshift(File.expand_path("../../../../lib", __FILE__))
