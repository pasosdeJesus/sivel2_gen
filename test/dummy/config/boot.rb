ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../../../Gemfile', __FILE__)
ENV['RACK_MULTIPART_LIMIT'] = '1024'
require 'bundler/setup' # Set up gems listed in the Gemfile.
$LOAD_PATH.unshift File.expand_path('../../../../lib', __FILE__)
