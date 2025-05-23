#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: true

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

batch_id = ARGV.first

if batch_id.nil?
  raise ArgumentError.new("must specify a message batch ID, `ruby examples/batch_results.rb msgbatch_123`")
end

result_stream = anthropic.messages.batches.results_streaming(batch_id)

result_stream.each do |result|
  pp(result)
end
