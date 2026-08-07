# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # An input memory store the dream reads from. The dream never mutates this store.
      module BetaDreamInput
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An input memory store the dream reads from. The dream never mutates this store.
        variant :memory_store, -> { Anthropic::Beta::BetaDreamMemoryStoreInput }

        # Input session transcripts the dream reads.
        variant :sessions, -> { Anthropic::Beta::BetaDreamSessionsInput }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :memory_store_id
        #
        #   @option args [Array<String>] :session_ids
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput]
        def self.new(type:, **args)
          case type.to_sym
          when :memory_store
            Anthropic::Beta::BetaDreamMemoryStoreInput.new(**args)
          when :sessions
            Anthropic::Beta::BetaDreamSessionsInput.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaDreamInput = Beta::BetaDreamInput
  end
end
