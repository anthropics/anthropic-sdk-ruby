# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserCustomToolResultEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # The id of the `agent.custom_tool_use` event this result corresponds to, which
          # can be found in the last `session.status_idle`
          # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
          # `stop_reason.event_ids` field.
          sig { returns(String) }
          attr_accessor :custom_tool_use_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The result content returned by the tool.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Content::Variants
                ]
              )
            )
          end
          attr_reader :content

          sig do
            params(
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash
                  )
                ]
            ).void
          end
          attr_writer :content

          # Whether the tool execution resulted in an error.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :is_error

          # A timestamp in RFC 3339 format
          sig { returns(T.nilable(Time)) }
          attr_accessor :processed_at

          # Routes this result to a subagent thread. Copy from the `agent.custom_tool_use`
          # event's `session_thread_id`.
          sig { returns(T.nilable(String)) }
          attr_accessor :session_thread_id

          # Event sent by the client providing the result of a custom tool execution.
          sig do
            params(
              id: String,
              custom_tool_use_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type::OrSymbol,
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash
                  )
                ],
              is_error: T.nilable(T::Boolean),
              processed_at: T.nilable(Time),
              session_thread_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # The id of the `agent.custom_tool_use` event this result corresponds to, which
            # can be found in the last `session.status_idle`
            # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
            # `stop_reason.event_ids` field.
            custom_tool_use_id:,
            type:,
            # The result content returned by the tool.
            content: nil,
            # Whether the tool execution resulted in an error.
            is_error: nil,
            # A timestamp in RFC 3339 format
            processed_at: nil,
            # Routes this result to a subagent thread. Copy from the `agent.custom_tool_use`
            # event's `session_thread_id`.
            session_thread_id: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                custom_tool_use_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type::TaggedSymbol,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Content::Variants
                  ],
                is_error: T.nilable(T::Boolean),
                processed_at: T.nilable(Time),
                session_thread_id: T.nilable(String)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_CUSTOM_TOOL_RESULT =
              T.let(
                :"user.custom_tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Content block in a tool result. Can be `text`, `image`, `document`, or
          # `search_result`.
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent::Content::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end
      end
    end
  end
end
