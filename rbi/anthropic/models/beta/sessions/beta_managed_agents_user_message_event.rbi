# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserMessageEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Array of content blocks comprising the user message.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Content::Variants
              ]
            )
          end
          attr_accessor :content

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :processed_at

          # A user message event in the session conversation.
          sig do
            params(
              id: String,
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash
                  )
                ],
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type::OrSymbol,
              processed_at: T.nilable(Time)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Array of content blocks comprising the user message.
            content:,
            type:,
            # A timestamp in RFC 3339 format
            processed_at: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Content::Variants
                  ],
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type::TaggedSymbol,
                processed_at: T.nilable(Time)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Content::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_MESSAGE =
              T.let(
                :"user.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent::Type::TaggedSymbol
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
