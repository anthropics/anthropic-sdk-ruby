# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSystemMessageEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          # System content blocks to append. Text-only.
          sig do
            returns(
              T::Array[Anthropic::Beta::BetaManagedAgentsSystemContentBlock]
            )
          end
          attr_accessor :content

          sig { returns(Symbol) }
          attr_accessor :type

          # Privileged context for the accompanying turn and all subsequent turns, appended
          # to the session's system context as a `role: "system"` turn rather than replacing
          # the top-level system prompt. At most one per request: it must be the final event
          # and immediately follow the `user.message`, `user.tool_result`, or
          # `user.custom_tool_result` it accompanies. Only supported on models that accept
          # mid-conversation system messages.
          sig do
            params(
              content:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
                ],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # System content blocks to append. Text-only.
            content:,
            type: :"system.message"
          )
          end

          sig do
            override.returns(
              {
                content:
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsSystemContentBlock
                  ],
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
