# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeploymentSystemMessageEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   System content blocks to append. Text-only.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsSystemContentBlock] }

        # @!attribute type
        #
        #   @return [Symbol, :"system.message"]
        required :type, const: :"system.message"

        # @!method initialize(content:, type: :"system.message")
        #   Privileged context for the accompanying turn and all subsequent turns, appended
        #   to the session's system context as a `role: "system"` turn rather than replacing
        #   the top-level system prompt.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] System content blocks to append. Text-only.
        #
        #   @param type [Symbol, :"system.message"]
      end
    end

    BetaManagedAgentsDeploymentSystemMessageEvent = Beta::BetaManagedAgentsDeploymentSystemMessageEvent
  end
end
