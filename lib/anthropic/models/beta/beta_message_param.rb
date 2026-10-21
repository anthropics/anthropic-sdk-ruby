# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaMessageParam
        extend Anthropic::Internal::Type::Union

        discriminator :role

        variant :user, -> { Anthropic::Beta::BetaUserMessageParam }

        variant :assistant, -> { Anthropic::Beta::BetaAssistantMessageParam }

        variant :system, -> { Anthropic::Beta::BetaSystemMessageParam }

        module Role
          extend Anthropic::Internal::Type::Enum

          USER = :user
          ASSISTANT = :assistant
          SYSTEM = :system

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam)]

        # Creates a new instance of the variant class whose `role` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaMessageParam} for more details.
        #
        # @param role [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock, Anthropic::Models::Beta::BetaMCPToolListingBlockParam, Anthropic::Models::Beta::BetaFallbackBlockParam>, String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaRequestToolAdditionBlock, Anthropic::Models::Beta::BetaRequestToolRemovalBlock>] :content
        #
        #   @option args [Symbol, Anthropic::Models::Beta::BetaSystemMessageParam::ClearAt, nil] :clear_at How long this system message's text stays in front of the model. `"never"` (the
        #
        #   @option args [Anthropic::Models::Beta::BetaSystemMessageOutputConfig, nil] :output_config Per-message output configuration on a role:"system" input message.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam]
        def self.new(role:, **args)
          case role.to_sym
          when :user
            Anthropic::Beta::BetaUserMessageParam.new(**args)
          when :assistant
            Anthropic::Beta::BetaAssistantMessageParam.new(**args)
          when :system
            Anthropic::Beta::BetaSystemMessageParam.new(**args)
          else
            raise ArgumentError, "unknown role: #{role}"
          end
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
