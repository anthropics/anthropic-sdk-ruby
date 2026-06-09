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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type }

        # @!method initialize(content:, type:)
        #   Privileged context for the accompanying turn and all subsequent turns, appended
        #   to the session's system context as a `role: "system"` turn rather than replacing
        #   the top-level system prompt.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] System content blocks to append. Text-only.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SYSTEM_MESSAGE = :"system.message"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeploymentSystemMessageEvent = Beta::BetaManagedAgentsDeploymentSystemMessageEvent
  end
end
