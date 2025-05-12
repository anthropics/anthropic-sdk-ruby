# typed: strong

module Anthropic
  module Models
    class ToolChoiceAny < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolChoiceAny, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      # Whether to disable parallel tool use.
      #
      # Defaults to `false`. If set to `true`, the model will output exactly one tool
      # use.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disable_parallel_tool_use

      sig { params(disable_parallel_tool_use: T::Boolean).void }
      attr_writer :disable_parallel_tool_use

      # The model will use any available tools.
      sig do
        params(disable_parallel_tool_use: T::Boolean, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Whether to disable parallel tool use.
        #
        # Defaults to `false`. If set to `true`, the model will output exactly one tool
        # use.
        disable_parallel_tool_use: nil,
        type: :any
      )
      end

      sig do
        override.returns(
          { type: Symbol, disable_parallel_tool_use: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
