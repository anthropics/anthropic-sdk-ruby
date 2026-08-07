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

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::RawContentBlockDelta} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :text
      #
      #   @option args [String] :partial_json
      #
      #   @option args [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation, Anthropic::Models::CitationsSearchResultLocation] :citation
      #
      #   @option args [String] :thinking The incremental `thinking` text for this content block. Concatenate the `thinkin
      #
      #   @option args [String] :signature The `signature` for this thinking block: an opaque value used to verify that the
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta]
      def self.new(type:, **args)
        case type.to_sym
        when :text_delta
          Anthropic::TextDelta.new(**args)
        when :input_json_delta
          Anthropic::InputJSONDelta.new(**args)
        when :citations_delta
          Anthropic::CitationsDelta.new(**args)
        when :thinking_delta
          Anthropic::ThinkingDelta.new(**args)
        when :signature_delta
          Anthropic::SignatureDelta.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
