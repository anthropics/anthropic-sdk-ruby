# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentUserMessageEvent =
      Beta::BetaManagedAgentsDeploymentUserMessageEvent

    module Beta
      class BetaManagedAgentsDeploymentUserMessageEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # Array of content blocks for the user message.
        sig do
          returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Content::Variants
            ]
          )
        end
        attr_accessor :content

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A user message sent to the session.
        sig do
          params(
            content:
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash
                )
              ],
            type:
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Array of content blocks for the user message.
          content:,
          type:
        )
        end

        sig do
          override.returns(
            {
              content:
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Content::Variants
                ],
              type:
                Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Content block in a user message. Can be `text`, `image`, or `document`.
        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Content::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER_MESSAGE =
            T.let(
              :"user.message",
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Type::TaggedSymbol
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
