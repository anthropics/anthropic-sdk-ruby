# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAutoPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :auto]
        required :type, const: :auto

        # @!method initialize(type: :auto)
        #   The server decides each tool call individually: it judges, from the tool, its
        #   input, and the session content so far, whether the call is safe to execute or
        #   high-risk, and evaluates it to allow when judged safe and to deny when judged
        #   high-risk. A call the server cannot reach a judgement on evaluates to ask.
        #
        #   @param type [Symbol, :auto]
      end
    end

    BetaManagedAgentsAutoPolicy = Beta::BetaManagedAgentsAutoPolicy
  end
end
