# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAdvisorParams < Anthropic::Internal::Type::BaseModel
        # @!attribute model
        #   A Claude model id. The model must be permitted as an advisor for this agent's
        #   model — see the sessions/threads/advisor spec.
        #
        #   @return [String]
        required :model, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAdvisorParams::Type }

        # @!method initialize(model:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams} for more details.
        #
        #   Platform advisor roster entry: a model the session's primary thread may consult
        #   mid-turn. At most one per roster; the entry occupies the roster name
        #   `anthropic.advisor`.
        #
        #   @param model [String] A Claude model id. The model must be permitted as an advisor for this agent's mo
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAdvisorParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          ADVISOR = :advisor

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAdvisorParams = Beta::BetaManagedAgentsAdvisorParams
  end
end
