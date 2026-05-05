# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentThreadMessageReceivedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent,
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
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Content::Variants
              ]
            )
          end
          attr_accessor :content

          # Public `sthr_` ID of the thread that sent the message.
          sig { returns(String) }
          attr_accessor :from_session_thread_id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Name of the callable agent this message came from. Absent when received from the
          # primary agent.
          sig { returns(T.nilable(String)) }
          attr_accessor :from_agent_name

          # Delivery event written to the target thread's input stream when an
          # agent-to-agent message arrives.
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
              from_session_thread_id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type::OrSymbol,
              from_agent_name: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Message content blocks.
            content:,
            # Public `sthr_` ID of the thread that sent the message.
            from_session_thread_id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:,
            # Name of the callable agent this message came from. Absent when received from the
            # primary agent.
            from_agent_name: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Content::Variants
                  ],
                from_session_thread_id: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type::TaggedSymbol,
                from_agent_name: T.nilable(String)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Content::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_THREAD_MESSAGE_RECEIVED =
              T.let(
                :"agent.thread_message_received",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent::Type::TaggedSymbol
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
