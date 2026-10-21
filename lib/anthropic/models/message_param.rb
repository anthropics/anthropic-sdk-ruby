# frozen_string_literal: true

module Anthropic
  module Models
    module MessageParam
      extend Anthropic::Internal::Type::Union

      discriminator :role

      variant :user, -> { Anthropic::UserMessageParam }

      variant :assistant, -> { Anthropic::AssistantMessageParam }

      variant :system, -> { Anthropic::SystemMessageParam }

      module Role
        extend Anthropic::Internal::Type::Enum

        USER = :user
        ASSISTANT = :assistant
        SYSTEM = :system

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam)]

      # Creates a new instance of the variant class whose `role` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # @param role [Symbol, Anthropic::Models::MessageParam::Role, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam>, String, Array<Anthropic::Models::TextBlockParam>] :content
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam]
      def self.new(role:, **args)
        case role.to_sym
        when :user
          Anthropic::UserMessageParam.new(**args)
        when :assistant
          Anthropic::AssistantMessageParam.new(**args)
        when :system
          Anthropic::SystemMessageParam.new(**args)
        else
          raise ArgumentError, "unknown role: #{role}"
        end
      end
    end
  end
end
