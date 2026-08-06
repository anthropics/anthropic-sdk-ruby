# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentMessageEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Array of text blocks comprising the agent response.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Content::Variants
              ]
            )
          end
          attr_accessor :content

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # An agent response event in the session conversation.
          sig do
            params(
              id: String,
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
                  )
                ],
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Array of text blocks comprising the agent response.
            content:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Content::Variants
                  ],
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Content block in an agent message.
          module Content
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                  Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Content::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_MESSAGE =
              T.let(
                :"agent.message",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent::Type::TaggedSymbol
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
