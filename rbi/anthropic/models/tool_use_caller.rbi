# typed: strong

module Anthropic
  module Models
    # Which party invoked the tool call: the model directly, or a server tool on its
    # behalf.
    module ToolUseCaller
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::DirectCaller,
            Anthropic::ServerToolCaller,
            Anthropic::ServerToolCaller20260120
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ToolUseCaller::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIRECT = T.let(:direct, Anthropic::ToolUseCaller::Type::TaggedSymbol)
        CODE_EXECUTION_20250825 =
          T.let(
            :code_execution_20250825,
            Anthropic::ToolUseCaller::Type::TaggedSymbol
          )
        CODE_EXECUTION_20260120 =
          T.let(
            :code_execution_20260120,
            Anthropic::ToolUseCaller::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ToolUseCaller::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::ToolUseCaller::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::ToolUseCaller::Type::OrSymbol,
          tool_id: String
        ).returns(Anthropic::ToolUseCaller::Variants)
      end
      def self.new(type:, tool_id: nil)
      end
    end
  end
end
