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
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
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
                Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock,
                Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock
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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              text: String,
              source:
                T.any(
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileImageSource::OrHash
                  ),
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::OrHash
                  )
                ),
              context: T.nilable(String),
              title: T.nilable(String)
            ).returns(
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent::Content::Variants
            )
          end
          def self.new(
            type:,
            # The text content.
            text: nil,
            # Union type for image source variants.
            source: nil,
            # Additional context about the document for the model.
            context: nil,
            # The title of the document.
            title: nil
          )
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
