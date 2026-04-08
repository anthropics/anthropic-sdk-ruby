# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentMCPToolResultEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # The id of the `agent.mcp_tool_use` event this result corresponds to.
          sig { returns(String) }
          attr_accessor :mcp_tool_use_id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The result content returned by the tool.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Content::Variants
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

          # Event representing the result of an MCP tool execution.
          sig do
            params(
              id: String,
              mcp_tool_use_id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type::OrSymbol,
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash
                  )
                ],
              is_error: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # The id of the `agent.mcp_tool_use` event this result corresponds to.
            mcp_tool_use_id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:,
            # The result content returned by the tool.
            content: nil,
            # Whether the tool execution resulted in an error.
            is_error: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                mcp_tool_use_id: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type::TaggedSymbol,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Content::Variants
                  ],
                is_error: T.nilable(T::Boolean)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT_MCP_TOOL_RESULT =
              T.let(
                :"agent.mcp_tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent::Content::Variants
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
