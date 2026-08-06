# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAdvisor < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   The advisor model id.
        #
        #   @return [String]
        required :model, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAdvisor::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAdvisor::Type }

        # @!method initialize(model:, type:)
        #   Platform advisor roster entry: a model the session's primary thread may consult
        #   mid-turn.
        #
        #   @param model [String] The advisor model id.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAdvisor::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAdvisor#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ADVISOR = :advisor

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAdvisor = Beta::BetaManagedAgentsAdvisor
  end
end
