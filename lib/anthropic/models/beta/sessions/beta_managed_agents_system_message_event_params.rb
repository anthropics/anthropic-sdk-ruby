# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSystemMessageEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute content
          #   System content blocks to append. Text-only.
          #
          #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>]
          required :content,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsSystemContentBlock] }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::Type }

          # @!method initialize(content:, type:)
          #   Privileged context for the accompanying turn and all subsequent turns, appended
          #   to the session's system context as a `role: "system"` turn rather than replacing
          #   the top-level system prompt. At most one per request: it must be the final event
          #   and immediately follow the `user.message`, `user.tool_result`, or
          #   `user.custom_tool_result` it accompanies. Only supported on models that accept
          #   mid-conversation system messages.
          #
          #   @param content [Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] System content blocks to append. Text-only.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SYSTEM_MESSAGE = :"system.message"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
