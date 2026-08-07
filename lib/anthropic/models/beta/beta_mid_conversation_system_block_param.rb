# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMidConversationSystemBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #   System instruction text blocks.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>]
        required :content,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaMidConversationSystemBlockParam::Content] }

        # @!attribute type
        #
        #   @return [Symbol, :mid_conv_system]
        required :type, const: :mid_conv_system

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(content:, cache_control: nil, type: :mid_conv_system)
        #   System instructions that appear mid-conversation.
        #
        #   Use this block to provide or update system-level instructions at a specific
        #   point in the conversation, rather than only via the top-level `system`
        #   parameter.
        #
        #   @param content [Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>] System instruction text blocks.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :mid_conv_system]

        # Mid-conversation directive to surface a declared tool.
        #
        # `tool` references a tool (or MCP toolset) by name from the request's `tools`; it
        # is offered to the model from this point in the conversation onward.
        module Content
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

          # Mid-conversation directive to surface a declared tool.
          #
          # ``tool`` references a tool (or MCP toolset) by name from the request's
          # ``tools``; it is offered to the model from this point in the
          # conversation onward.
          variant :tool_addition, -> { Anthropic::Beta::BetaRequestToolAdditionBlock }

          # Mid-conversation directive to withdraw a tool.
          #
          # ``tool`` references a tool (or MCP toolset) by name from the request's
          # ``tools``; it is no longer offered to the model from this point in the
          # conversation onward.
          variant :tool_removal, -> { Anthropic::Beta::BetaRequestToolRemovalBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaMidConversationSystemBlockParam::Content} for more
          # details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :text
          #
          #   @option args [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
          #
          #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam, Anthropic::Models::Beta::BetaCitationSearchResultLocationParam>, nil] :citations
          #
          #   @option args [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference] :tool Reference to a single tool the caller declared directly in
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock]
          def self.new(type:, **args)
            case type.to_sym
            when :text
              Anthropic::Beta::BetaTextBlockParam.new(**args)
            when :tool_addition
              Anthropic::Beta::BetaRequestToolAdditionBlock.new(**args)
            when :tool_removal
              Anthropic::Beta::BetaRequestToolRemovalBlock.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaMidConversationSystemBlockParam = Beta::BetaMidConversationSystemBlockParam
  end
end
