# typed: strong

module Anthropic
  module Models
    class MemoryTool20250818 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::MemoryTool20250818, Anthropic::Internal::AnyHash)
        end

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in `tool_use` blocks.
      sig { returns(Symbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        returns(
          T.nilable(
            T::Array[Anthropic::MemoryTool20250818::AllowedCaller::OrSymbol]
          )
        )
      end
      attr_reader :allowed_callers

      sig do
        params(
          allowed_callers:
            T::Array[Anthropic::MemoryTool20250818::AllowedCaller::OrSymbol]
        ).void
      end
      attr_writer :allowed_callers

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # If true, tool will not be included in initial system prompt. Only loaded when
      # returned via tool_reference from tool search.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :defer_loading

      sig { params(defer_loading: T::Boolean).void }
      attr_writer :defer_loading

      sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
      attr_reader :input_examples

      sig { params(input_examples: T::Array[T::Hash[Symbol, T.anything]]).void }
      attr_writer :input_examples

      # When true, guarantees schema validation on tool names and inputs
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :strict

      sig { params(strict: T::Boolean).void }
      attr_writer :strict

      sig do
        params(
          allowed_callers:
            T::Array[Anthropic::MemoryTool20250818::AllowedCaller::OrSymbol],
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          defer_loading: T::Boolean,
          input_examples: T::Array[T::Hash[Symbol, T.anything]],
          strict: T::Boolean,
          name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        allowed_callers: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        defer_loading: nil,
        input_examples: nil,
        # When true, guarantees schema validation on tool names and inputs
        strict: nil,
        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        name: :memory,
        type: :memory_20250818
      )
      end

      sig do
        override.returns(
          {
            name: Symbol,
            type: Symbol,
            allowed_callers:
              T::Array[Anthropic::MemoryTool20250818::AllowedCaller::OrSymbol],
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            defer_loading: T::Boolean,
            input_examples: T::Array[T::Hash[Symbol, T.anything]],
            strict: T::Boolean
          }
        )
      end
      def to_hash
      end

      module AllowedCaller
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::MemoryTool20250818::AllowedCaller)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIRECT =
          T.let(
            :direct,
            Anthropic::MemoryTool20250818::AllowedCaller::TaggedSymbol
          )
        CODE_EXECUTION_20250825 =
          T.let(
            :code_execution_20250825,
            Anthropic::MemoryTool20250818::AllowedCaller::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::MemoryTool20250818::AllowedCaller::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
