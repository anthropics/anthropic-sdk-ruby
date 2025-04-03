# frozen_string_literal: true

module Anthropic
  module Models
    module RawContentBlockDelta
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text_delta, -> { Anthropic::Models::TextDelta }

      variant :input_json_delta, -> { Anthropic::Models::InputJSONDelta }

      variant :citations_delta, -> { Anthropic::Models::CitationsDelta }

      variant :thinking_delta, -> { Anthropic::Models::ThinkingDelta }

      variant :signature_delta, -> { Anthropic::Models::SignatureDelta }

      # @!parse
      #   # @return [Array(Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta)]
      #   def self.variants; end
    end
  end
end
