# typed: strong

module Anthropic
  module Models
    # How the model should use the provided tools. The model can use a specific tool,
    # any available tool, decide by itself, or not use tools at all.
    module ToolChoice
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ToolChoiceAuto,
            Anthropic::ToolChoiceAny,
            Anthropic::ToolChoiceTool,
            Anthropic::ToolChoiceNone
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ToolChoice::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        AUTO = T.let(:auto, Anthropic::ToolChoice::Type::TaggedSymbol)
        ANY = T.let(:any, Anthropic::ToolChoice::Type::TaggedSymbol)
        TOOL = T.let(:tool, Anthropic::ToolChoice::Type::TaggedSymbol)
        NONE = T.let(:none, Anthropic::ToolChoice::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Anthropic::ToolChoice::Type::TaggedSymbol])
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::ToolChoice::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: T.any(Symbol, String),
          disable_parallel_tool_use: T::Boolean,
          name: String
        ).returns(Anthropic::ToolChoice::Variants)
      end
      def self.new(
        type:,
        # Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output at most one tool
        # use.
        disable_parallel_tool_use: nil,
        # The name of the tool to use.
        name: nil
      )
      end
    end
  end
end
