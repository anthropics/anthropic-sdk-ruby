# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The default destination: the job creates a new output memory store as a clone of
      # the memory_store input and writes the consolidated memories into it. The input
      # store is never mutated.
      module BetaOutputBehavior
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The default destination: the job creates a new output memory store as a clone of the memory_store input and writes the consolidated memories into it. The input store is never mutated.
        variant :create_new, -> { Anthropic::Beta::BetaOutputBehaviorCreateNew }

        # The job writes the consolidated memories into this existing memory store instead of creating one. In EAP the store must be the job's own memory_store input, so the job consolidates the store in place.
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
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :memory_store_id
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
