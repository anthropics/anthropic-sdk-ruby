# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # How the model should use the provided tools. The model can use a specific tool,
      # any available tool, decide by itself, or not use tools at all.
      module BetaToolChoice
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The model will automatically decide whether to use tools.
        variant :auto, -> { Anthropic::Beta::BetaToolChoiceAuto }

        # The model will use any available tools.
        variant :any, -> { Anthropic::Beta::BetaToolChoiceAny }

        # The model will use the specified tool with `tool_choice.name`.
        variant :tool, -> { Anthropic::Beta::BetaToolChoiceTool }

        # The model will not be allowed to use tools.
        variant :none, -> { Anthropic::Beta::BetaToolChoiceNone }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaToolChoice} for more details.
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
        # @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        def self.new(type:, **args)
          case type.to_sym
          when :auto
            Anthropic::Beta::BetaToolChoiceAuto.new(**args)
          when :any
            Anthropic::Beta::BetaToolChoiceAny.new(**args)
          when :tool
            Anthropic::Beta::BetaToolChoiceTool.new(**args)
          when :none
            Anthropic::Beta::BetaToolChoiceNone.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaToolChoice = Beta::BetaToolChoice
  end
end
