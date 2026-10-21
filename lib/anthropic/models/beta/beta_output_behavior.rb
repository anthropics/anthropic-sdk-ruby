# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Which memory store a dream writes its result to. Defaults to `create_new` when
      # left out of a create request.
      module BetaOutputBehavior
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Write the result to a new memory store that starts as a copy of the input memory store. This is the default.
        #
        # The new memory store is in the same workspace as the dream. The dream doesn't change the input memory store.
        variant :create_new, -> { Anthropic::Beta::BetaOutputBehaviorCreateNew }

        # Write the result into the input memory store instead of a new memory store.
        #
        # The credential must be allowed to write memory stores, or the request returns a 403 error. While another `update_existing` dream on the same memory store hasn't fully stopped, the request returns a 409 error.
        variant :update_existing, -> { Anthropic::Beta::BetaOutputBehaviorUpdateExisting }

        module Type
          extend Anthropic::Internal::Type::Enum

          CREATE_NEW = :create_new
          UPDATE_EXISTING = :update_existing

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaOutputBehavior} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaOutputBehavior::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :memory_store_id The ID of the memory store for the dream to write its result to (`memstore_...`)
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaOutputBehaviorCreateNew, Anthropic::Models::Beta::BetaOutputBehaviorUpdateExisting]
        def self.new(type:, **args)
          case type.to_sym
          when :create_new
            Anthropic::Beta::BetaOutputBehaviorCreateNew.new(**args)
          when :update_existing
            Anthropic::Beta::BetaOutputBehaviorUpdateExisting.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaOutputBehavior = Beta::BetaOutputBehavior
  end
end
