# Require our gems
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'active_support/all'
Dotenv.load

# Tempo DB
$tempodb = TempoDB::Client.new(ENV["TEMPO_APIKEY"], ENV["TEMPO_APISECRET"])

require_relative 'lib/tesla_api'
require_relative 'lib/tesla_stream_reader'

puts "Loading up Tesla API Streamer..."
reader = TeslaStreamReader.new(ENV['TESLA_EMAIL'], ENV['TESLA_PASS'])
reader.stream_to_tempodb