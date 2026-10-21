# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSystemMessageParam < Anthropic::Internal::Type::BaseModel
        # @!attribute role
        #
        #   @return [Symbol, :system]
        required :role, const: :system

        # @!attribute clear_at
        #   How long this system message's text stays in front of the model. `"never"` (the
        #   default) renders it on every request that includes it. `"next_user_message"`
        #   renders it only for the user turn it follows: once a later `role: "user"`
        #   message exists in `messages` the message stays in the array (send it unchanged)
        #   but is no longer shown to the model. Only permitted on `role: "system"`
        #   messages.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaSystemMessageParam::ClearAt, nil]
        optional :clear_at, enum: -> { Anthropic::Beta::BetaSystemMessageParam::ClearAt }, nil?: true

        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>, nil]
        optional :content, union: -> { Anthropic::Beta::BetaSystemMessageParam::Content }

        # @!attribute output_config
        #   Per-message output configuration on a role:"system" input message.
        #
        #   Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
        #   accepted on a message that carries content; a message with neither content nor
        #   output_config fields is rejected.
        #
        #   @return [Anthropic::Models::Beta::BetaSystemMessageOutputConfig, nil]
        optional :output_config, -> { Anthropic::Beta::BetaSystemMessageOutputConfig }, nil?: true

        # @!method initialize(clear_at: nil, content: nil, output_config: nil, role: :system)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaSystemMessageParam} for more details.
        #
        #   @param clear_at [Symbol, Anthropic::Models::Beta::BetaSystemMessageParam::ClearAt, nil] How long this system message's text stays in front of the model. `"never"` (the
        #
        #   @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>]
        #
        #   @param output_config [Anthropic::Models::Beta::BetaSystemMessageOutputConfig, nil] Per-message output configuration on a role:"system" input message.
        #
        #   @param role [Symbol, :system]

        # How long this system message's text stays in front of the model. `"never"` (the
        # default) renders it on every request that includes it. `"next_user_message"`
        # renders it only for the user turn it follows: once a later `role: "user"`
        # message exists in `messages` the message stays in the array (send it unchanged)
        # but is no longer shown to the model. Only permitted on `role: "system"`
        # messages.
        #
        # @see Anthropic::Models::Beta::BetaSystemMessageParam#clear_at
        module ClearAt
          extend Anthropic::Internal::Type::Enum

          NEXT_USER_MESSAGE = :next_user_message
          NEVER = :never

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Anthropic::Models::Beta::BetaSystemMessageParam#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaSystemMessageParam::Content::BlockArray }

          module Block
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

            # Mid-conversation directive to make a tool available.
            #
            # ``tool`` is a reference to a tool (or MCP toolset) declared in the
            # request's ``tools``. Under the ``inline-tools-2026-09-15`` beta it may
            # instead be a reference to a tool defined earlier in ``messages``, or a
            # ``tool_definition`` object that carries an inline tool definition in
            # ``definition`` (the same object a ``tools`` entry holds). An ``mcp_toolset``
            # definition also requires the ``mcp-client-2026-09-15`` beta. The tool is
            # offered to the model from this point in the conversation onward.
            variant :tool_addition, -> { Anthropic::Beta::BetaRequestToolAdditionBlock }

            # Mid-conversation directive to withdraw a tool.
            #
            # ``tool`` references a tool (or MCP toolset) by name: one declared in the
            # request's ``tools`` or defined earlier in ``messages``. It is no longer
            # offered to the model from this point in the conversation onward.
            variant :tool_removal, -> { Anthropic::Beta::BetaRequestToolRemovalBlock }

            module Type
              extend Anthropic::Internal::Type::Enum

              TEXT = :text
              TOOL_ADDITION = :tool_addition
              TOOL_REMOVAL = :tool_removal

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::BetaSystemMessageParam::Content::Block::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :text
            #
            #   @option args [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam, Anthropic::Models::Beta::BetaCitationSearchResultLocationParam>, nil] :citations
            #
            #   @option args [Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference, Anthropic::Models::Beta::BetaToolChangeToolDefinitionParam, Anthropic::Models::Beta::BetaToolChangeToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolReference, Anthropic::Models::Beta::BetaToolChangeMCPToolsetReference] :tool
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

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>)]

          # @type [Anthropic::Internal::Type::Converter]
          BlockArray =
            Anthropic::Internal::Type::ArrayOf[union: -> {
              Anthropic::Beta::BetaSystemMessageParam::Content::Block
            }]
        end
      end
    end

    BetaSystemMessageParam = Beta::BetaSystemMessageParam
  end
end
