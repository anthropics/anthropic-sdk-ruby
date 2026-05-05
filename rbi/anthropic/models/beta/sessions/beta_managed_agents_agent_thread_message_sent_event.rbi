# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadMessageSentEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Message content blocks.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Content::Variants
              ]
            )
          end
          attr_accessor :content

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # Public `sthr_` ID of the thread the message was sent to.
          sig { returns(String) }
          attr_accessor :to_session_thread_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Name of the callable agent this message was sent to. Absent when sent to the
          # primary agent.
          sig { returns(T.nilable(String)) }
          attr_accessor :to_agent_name

          # Observability event emitted to the sender's output stream when an agent-to-agent
          # message is sent.
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
              processed_at: Time,
              to_session_thread_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type::OrSymbol,
              to_agent_name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Message content blocks.
            content:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # Public `sthr_` ID of the thread the message was sent to.
            to_session_thread_id:,
            type:,
            # Name of the callable agent this message was sent to. Absent when sent to the
            # primary agent.
            to_agent_name: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Content::Variants
                  ],
                processed_at: Time,
                to_session_thread_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type::TaggedSymbol,
                to_agent_name: T.nilable(String)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Content::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_THREAD_MESSAGE_SENT =
              T.let(
                :"agent.thread_message_sent",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent::Type::TaggedSymbol
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
