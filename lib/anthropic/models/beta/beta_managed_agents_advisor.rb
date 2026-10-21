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
        #   @return [Symbol, :advisor]
        required :type, const: :advisor

        # @!method initialize(model:, type: :advisor)
        #   Platform advisor roster entry: a model the session's primary thread may consult
        #   mid-turn.
        #
        #   @param model [String] The advisor model id.
        #
        #   @param type [Symbol, :advisor]
      end
    end

    BetaManagedAgentsAdvisor = Beta::BetaManagedAgentsAdvisor
  end
end
