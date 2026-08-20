# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserToolResultEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The id of the `agent.tool_use` event this result corresponds to, which can be
          # found in the last `session.status_idle`
          # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
          # `stop_reason.event_ids` field.
          sig { returns(String) }
          attr_accessor :tool_use_id

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # The result content returned by the tool.
          sig do
            returns(
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock
                  )
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
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock::OrHash
                  )
                ]
            ).void
          end
          attr_writer :content

          # Whether the tool execution resulted in an error.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :is_error

          # Parameters for providing the result of an agent-toolset tool execution. Only
          # valid on `self_hosted` environments, where sandbox-routed tools are executed by
          # the client rather than the server.
          sig do
            params(
              tool_use_id: String,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type::OrSymbol,
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock::OrHash
                  )
                ],
              is_error: T.nilable(T::Boolean)
            ).returns(T.attached_class)
          end
          def self.new(
            # The id of the `agent.tool_use` event this result corresponds to, which can be
            # found in the last `session.status_idle`
            # [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
            # `stop_reason.event_ids` field.
            tool_use_id:,
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
                tool_use_id: String,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type::OrSymbol,
                content:
                  T::Array[
                    T.any(
                      Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
                      Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock,
                      Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock,
                      Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock
                    )
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_TOOL_RESULT =
              T.let(
                :"user.tool_result",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type::TaggedSymbol
                )
              IMAGE =
                T.let(
                  :image,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type::TaggedSymbol
                )
              DOCUMENT =
                T.let(
                  :document,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type::TaggedSymbol
                )
              SEARCH_RESULT =
                T.let(
                  :search_result,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Variants
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
                    ),
                    String
                  ),
                context: T.nilable(String),
                title: T.any(T.nilable(String), String),
                citations:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations::OrHash,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent::OrHash
                  ]
              ).returns(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::Content::Variants
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
              title: nil,
              # Citation settings for a search result.
              citations: nil,
              # Array of text content blocks from the search result.
              content: nil
            )
            end
          end
        end
      end
    end
  end
end
