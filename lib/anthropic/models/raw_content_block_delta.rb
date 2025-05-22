# frozen_string_literal: true

module Anthropic
  module Models
    module RawContentBlockDelta
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text_delta, -> { Anthropic::TextDelta }

      variant :input_json_delta, -> { Anthropic::InputJSONDelta }

      variant :citations_delta, -> { Anthropic::CitationsDelta }

      variant :thinking_delta, -> { Anthropic::ThinkingDelta }

      variant :signature_delta, -> { Anthropic::SignatureDelta }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta)]
    end
  end
end
