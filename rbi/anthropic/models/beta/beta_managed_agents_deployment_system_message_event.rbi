# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentSystemMessageEvent =
      Beta::BetaManagedAgentsDeploymentSystemMessageEvent

    module Beta
      class BetaManagedAgentsDeploymentSystemMessageEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent,
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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Privileged context for the accompanying turn and all subsequent turns, appended
        # to the session's system context as a `role: "system"` turn rather than replacing
        # the top-level system prompt.
        sig do
          params(
            content:
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
              ],
            type:
              Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # System content blocks to append. Text-only.
          content:,
          type:
        )
        end

        sig do
          override.returns(
            {
              content:
                T::Array[Anthropic::Beta::BetaManagedAgentsSystemContentBlock],
              type:
                Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SYSTEM_MESSAGE =
            T.let(
              :"system.message",
              Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
