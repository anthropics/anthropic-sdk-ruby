# frozen_string_literal: true

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    # any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # The model will automatically decide whether to use tools.
      variant :auto, -> { Anthropic::ToolChoiceAuto }

      # The model will use any available tools.
      variant :any, -> { Anthropic::ToolChoiceAny }

      # The model will use the specified tool with `tool_choice.name`.
      variant :tool, -> { Anthropic::ToolChoiceTool }

      # The model will not be allowed to use tools.
      variant :none, -> { Anthropic::ToolChoiceNone }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ToolChoice} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [Boolean] :disable_parallel_tool_use Whether to disable parallel tool use.
      #
      #   @option args [String] :name The name of the tool to use.
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone]
      def self.new(type:, **args)
        case type.to_sym
        when :auto
          Anthropic::ToolChoiceAuto.new(**args)
        when :any
          Anthropic::ToolChoiceAny.new(**args)
        when :tool
          Anthropic::ToolChoiceTool.new(**args)
        when :none
          Anthropic::ToolChoiceNone.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
