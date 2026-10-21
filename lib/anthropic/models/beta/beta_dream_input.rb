# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # A source that a dream reads, such as a memory store or a set of sessions.
      module BetaDreamInput
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The memory store that a dream reads, given as an entry in `inputs`.
        #
        # With `output_behavior` set to `update_existing`, the dream writes its result into this memory store. Otherwise the dream doesn't change it.
        variant :memory_store, -> { Anthropic::Beta::BetaDreamMemoryStoreInput }

        # The sessions that a dream reads, given as an entry in `inputs`.
        variant :sessions, -> { Anthropic::Beta::BetaDreamSessionsInput }

        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE = :memory_store
          SESSIONS = :sessions

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaDreamMemoryStoreInput, Anthropic::Models::Beta::BetaDreamSessionsInput)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaDreamInput} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaDreamInput::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :memory_store_id The ID of the memory store for the dream to read (`memstore_...`).
        #
        #   @option args [Array<String>] :session_ids The IDs of the sessions whose transcripts the dream reads (`sesn_...`).
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
