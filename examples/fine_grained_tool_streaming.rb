#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/anthropic"

# Gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

puts "----- Fine-Grained Tool Streaming Example -----"
puts

# This example demonstrates the fine-grained tool streaming functionality
# using the official example from Anthropic's documentation.
# It shows how array parameters can be streamed incrementally with fine-grained control.

puts "Creating stream with fine-grained tool streaming beta header..."

class MakeFile < Anthropic::BaseModel
  required :filename, String
  required :lines_of_text, Anthropic::ArrayOf[String]

  doc "Write text to a file"
end

# Using the official example: write a long poem to demonstrate
# how fine-grained streaming affects array parameter chunking
stream = anthropic.messages.stream(
  max_tokens: 1024,
  model: "claude-sonnet-4-5-20250929",
  tools: [MakeFile],
  messages: [
    {
      role: "user",
      content: "Can you write a 30 line poem and make a file called poem.txt?"
    }
  ],
  # This is the key header that enables fine-grained tool streaming
  request_options: {
    extra_headers: {
      "anthropic-beta" => "fine-grained-tool-streaming-2025-05-14"
    }
  }
)

puts "Streaming response with fine-grained tool streaming enabled..."
puts "Watching for JSON input events to observe chunking behavior:"
puts

json_chunks = []
current_tool_call = nil
stream.each do |event|
  case event
  when Anthropic::Streaming::InputJsonEvent
    # Collect JSON chunks to analyze streaming behavior
    json_chunks << {
      delta: event.partial_json,
      snapshot: event.snapshot,
      timestamp: Time.now
    }

    puts("JSON Delta: #{event.partial_json.inspect}")
    puts("JSON Snapshot: #{event.snapshot}")
    puts("---")

  when Anthropic::Streaming::ContentBlockStopEvent
    if event.content_block.type == :tool_use
      current_tool_call = event.content_block
      puts("Tool call completed: #{current_tool_call.name}")
      puts("Final input: #{current_tool_call.input}")
      puts
    end
  end
end

puts
puts "=== Analysis ==="
puts "Total JSON chunks received: #{json_chunks.length}"

if json_chunks.any?
  puts "Chunk sizes:"
  json_chunks.each_with_index do |chunk, index|
    puts "  Chunk #{index + 1}: #{chunk[:delta].length} characters"
  end

  puts
  puts "First chunk: #{json_chunks.first[:delta].inspect}"
  puts "Last chunk: #{json_chunks.last[:delta].inspect}"
end

if current_tool_call
  puts
  puts "Final tool call input:"
  puts JSON.pretty_generate(current_tool_call.input) if current_tool_call.input.is_a?(Hash)
end

puts
puts "Example completed. The fine-grained tool streaming header should affect"
puts "how JSON is chunked during streaming. Compare this with regular streaming"
puts "to see the difference in behavior."
