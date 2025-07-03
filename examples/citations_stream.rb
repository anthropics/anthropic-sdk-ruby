#!/usr/bin/env ruby
# frozen_string_literal: true
# typed: strict

require_relative "../lib/anthropic"

# gets API credentials from environment variable `ANTHROPIC_API_KEY`
anthropic = Anthropic::Client.new

pp("----- citations stream -----")

# create a document that can be cited by the model in its response.
document = {
  type: "document",
  source: {
    type: "text",
    media_type: "text/plain",
    data: <<~TEXT
      Rayleigh scattering is the primary reason the daytime sky appears blue.
      Molecules in Earth's atmosphere scatter shorter-wavelength (blue) light
      much more efficiently than longer-wavelength (red) light.  Because this
      scattered blue light reaches our eyes from every direction, the sky has
      a blue hue under normal daylight conditions.
    TEXT
  },
  title: "Rayleigh Scattering Overview",
  citations: {enabled: true}
}

messages = [
  {
    role: "user",
    content: [
      document,
      {
        type: "text",
        text: "Why is the sky blue during the day? Use citations to back up your answer."
      }
    ]
  }
]

stream = anthropic.messages.stream(
  model: :"claude-sonnet-4-20250514",
  max_tokens: 1024,
  system_: "When answering the user's question, cite relevant information from the provided documents.",
  messages: messages
)

citations = []
stream.each do |event|
  case event
  when Anthropic::Streaming::CitationEvent
    # a CitationEvent is streamed when the model references the provided document.
    puts("[citation: #{citations.length}]")
    citations.push(event.citation)
  when Anthropic::Streaming::TextEvent
    print(event.text)
  end
end

puts("\n\nCitations:\n-----")

# display details about each citation that was collected during streaming
citations.each_with_index do |citation, i|
  print("[#{i}]: ")
  case citation
  when Anthropic::Models::CitationCharLocation
    puts("#{citation.document_title}: #{citation.start_char_index}-#{citation.end_char_index}")
  else
    puts(citation.type)
  end
end
