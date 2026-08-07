# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Token usage for a sampling iteration.
      module BetaIterationsUsageItem
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Token usage for a sampling iteration.
        variant :message, -> { Anthropic::Beta::BetaMessageIterationUsage }

        # Token usage for a compaction iteration.
        variant :compaction, -> { Anthropic::Beta::BetaCompactionIterationUsage }

        # Token usage for an advisor sub-inference iteration.
        variant :advisor_message, -> { Anthropic::Beta::BetaAdvisorMessageIterationUsage }

        # Token usage for the fallback-model attempt of a server-side fallback request.
        #
        # Produced in place of a `message` entry for whichever hop served the
        # response. A declined hop produces the existing `message` entry. Whether
        # a fallback model served the response is signalled by the presence of this
        # entry in `usage.iterations`.
        variant :fallback_message, -> { Anthropic::Beta::BetaFallbackMessageIterationUsage }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage, Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage, Anthropic::Models::Beta::BetaFallbackMessageIterationUsage)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaIterationsUsageItem} for more details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaCacheCreation, nil] :cache_creation Breakdown of cached tokens by TTL
        #
        #   @option args [Integer] :cache_creation_input_tokens The number of input tokens used to create the cache entry.
        #
        #   @option args [Integer] :cache_read_input_tokens The number of input tokens read from the cache.
        #
        #   @option args [Integer] :input_tokens The number of input tokens which were used.
        #
        #   @option args [Symbol, String, Anthropic::Models::Model] :model The model that will complete your prompt.
        #
        #   @option args [Integer] :output_tokens The number of output tokens which were used.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaMessageIterationUsage, Anthropic::Models::Beta::BetaCompactionIterationUsage, Anthropic::Models::Beta::BetaAdvisorMessageIterationUsage, Anthropic::Models::Beta::BetaFallbackMessageIterationUsage]
        def self.new(type:, **args)
          case type.to_sym
          when :message
            Anthropic::Beta::BetaMessageIterationUsage.new(**args)
          when :compaction
            Anthropic::Beta::BetaCompactionIterationUsage.new(**args)
          when :advisor_message
            Anthropic::Beta::BetaAdvisorMessageIterationUsage.new(**args)
          when :fallback_message
            Anthropic::Beta::BetaFallbackMessageIterationUsage.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end

      # @type [Anthropic::Internal::Type::Converter]
      BetaIterationsUsage =
        Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Beta::BetaIterationsUsageItem }]
    end

    # @type [Anthropic::Internal::Type::Converter]
    BetaIterationsUsage = Beta::BetaIterationsUsage
  end
end
