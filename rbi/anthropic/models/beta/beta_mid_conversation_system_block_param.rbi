# typed: strong

module Anthropic
  module Models
    BetaMidConversationSystemBlockParam =
      Beta::BetaMidConversationSystemBlockParam

    module Beta
      class BetaMidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMidConversationSystemBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # System instruction text blocks.
        sig do
          returns(
            T::Array[
              T.any(
                Anthropic::Beta::BetaTextBlockParam,
                Anthropic::Beta::BetaRequestToolAdditionBlock,
                Anthropic::Beta::BetaRequestToolRemovalBlock
              )
            ]
          )
        end
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # System instructions that appear mid-conversation.
        #
        # Use this block to provide or update system-level instructions at a specific
        # point in the conversation, rather than only via the top-level `system`
        # parameter.
        sig do
          params(
            content:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaTextBlockParam::OrHash,
                  Anthropic::Beta::BetaRequestToolAdditionBlock::OrHash,
                  Anthropic::Beta::BetaRequestToolRemovalBlock::OrHash
                )
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # System instruction text blocks.
          content:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :mid_conv_system
        )
        end

        sig do
          override.returns(
            {
              content:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTextBlockParam,
                    Anthropic::Beta::BetaRequestToolAdditionBlock,
                    Anthropic::Beta::BetaRequestToolRemovalBlock
                  )
                ],
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end

        # Mid-conversation directive to surface a declared tool.
        #
        # `tool` references a tool (or MCP toolset) by name from the request's `tools`; it
        # is offered to the model from this point in the conversation onward.
        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaTextBlockParam,
                Anthropic::Beta::BetaRequestToolAdditionBlock,
                Anthropic::Beta::BetaRequestToolRemovalBlock
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaMidConversationSystemBlockParam::Content::Variants
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
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
              citations:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaCitationCharLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationPageLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationContentBlockLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash,
                      Anthropic::Beta::BetaCitationSearchResultLocationParam::OrHash
                    )
                  ]
                ),
              tool:
                T.any(
                  Anthropic::Beta::BetaToolChangeToolReference::OrHash,
                  Anthropic::Beta::BetaToolChangeMCPToolReference::OrHash,
                  Anthropic::Beta::BetaToolChangeMCPToolsetReference::OrHash
                )
            ).returns(
              Anthropic::Beta::BetaMidConversationSystemBlockParam::Content::Variants
            )
          end
          def self.new(
            type:,
            text: nil,
            # Create a cache control breakpoint at this content block.
            cache_control: nil,
            citations: nil,
            # Reference to a single tool the caller declared directly in `tools[]`. Does not
            # accept the composed `{server}_{name}` form the server assigns to MCP-resolved
            # tools — use `mcp_tool_reference` or `mcp_toolset_reference` for those.
            tool: nil
          )
          end
        end
      end
    end
  end
end
