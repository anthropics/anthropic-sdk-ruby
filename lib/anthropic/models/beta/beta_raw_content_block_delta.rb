# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaRawContentBlockDelta
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text_delta, -> { Anthropic::Beta::BetaTextDelta }

        variant :input_json_delta, -> { Anthropic::Beta::BetaInputJSONDelta }

        variant :citations_delta, -> { Anthropic::Beta::BetaCitationsDelta }

        variant :thinking_delta, -> { Anthropic::Beta::BetaThinkingDelta }

        variant :signature_delta, -> { Anthropic::Beta::BetaSignatureDelta }

        variant :compaction_delta, -> { Anthropic::Beta::BetaCompactionContentBlockDelta }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta, Anthropic::Models::Beta::BetaCompactionContentBlockDelta)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaRawContentBlockDelta} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :text
        #
        #   @option args [String] :partial_json
        #
        #   @option args [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation, Anthropic::Models::Beta::BetaCitationSearchResultLocation] :citation
        #
        #   @option args [Integer, nil] :estimated_tokens Per-frame increment of a coarse, running estimate of the tokens this thinking bl
        #
        #   @option args [String] :thinking The incremental `thinking` text for this content block. Concatenate the `thinkin
        #
        #   @option args [String] :signature The `signature` for this thinking block: an opaque value used to verify that the
        #
        #   @option args [String, nil] :content
        #
        #   @option args [String, nil] :encrypted_content Opaque metadata from prior compaction, to be round-tripped verbatim
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaTextDelta, Anthropic::Models::Beta::BetaInputJSONDelta, Anthropic::Models::Beta::BetaCitationsDelta, Anthropic::Models::Beta::BetaThinkingDelta, Anthropic::Models::Beta::BetaSignatureDelta, Anthropic::Models::Beta::BetaCompactionContentBlockDelta]
        def self.new(type:, **args)
          case type.to_sym
          when :text_delta
            Anthropic::Beta::BetaTextDelta.new(**args)
          when :input_json_delta
            Anthropic::Beta::BetaInputJSONDelta.new(**args)
          when :citations_delta
            Anthropic::Beta::BetaCitationsDelta.new(**args)
          when :thinking_delta
            Anthropic::Beta::BetaThinkingDelta.new(**args)
          when :signature_delta
            Anthropic::Beta::BetaSignatureDelta.new(**args)
          when :compaction_delta
            Anthropic::Beta::BetaCompactionContentBlockDelta.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaRawContentBlockDelta = Beta::BetaRawContentBlockDelta
  end
end
