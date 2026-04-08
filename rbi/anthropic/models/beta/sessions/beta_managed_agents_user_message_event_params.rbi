# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserMessageEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Array of content blocks for the user message.
          sig do
            returns(
              T::Array[
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                  Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock
                )
              ]
            )
          end
          attr_accessor :content

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Parameters for sending a user message to the session.
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
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type::OrSymbol
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
                    T.any(
                      Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                      Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                      Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock
                    )
                  ],
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type::OrSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Content::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_MESSAGE =
              T.let(
                :"user.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::Type::TaggedSymbol
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
end
