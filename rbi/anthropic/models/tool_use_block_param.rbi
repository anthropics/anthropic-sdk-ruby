# typed: strong

module Anthropic
  module Models
    class ToolUseBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ToolUseBlockParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :input

      sig { returns(String) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Tool invocation directly from the model.
      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::DirectCaller,
              Anthropic::ServerToolCaller,
              Anthropic::ServerToolCaller20260120
            )
          )
        )
      end
      attr_reader :caller_

      sig do
        params(
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            )
        ).void
      end
      attr_writer :caller_

      # For a toolset member tool_use, the toolset family this member belongs to.
      sig { returns(T.nilable(String)) }
      attr_accessor :toolset_name

      sig do
        params(
          id: String,
          input: T::Hash[Symbol, T.anything],
          name: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          toolset_name: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        input:,
        name:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Tool invocation directly from the model.
        caller_: nil,
        # For a toolset member tool_use, the toolset family this member belongs to.
        toolset_name: nil,
        type: :tool_use
      )
      end

      sig do
        override.returns(
          {
            id: String,
            input: T::Hash[Symbol, T.anything],
            name: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            caller_:
              T.any(
                Anthropic::DirectCaller,
                Anthropic::ServerToolCaller,
                Anthropic::ServerToolCaller20260120
              ),
            toolset_name: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Tool invocation directly from the model.
      module Caller
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
            T.type_alias do
              T.all(Symbol, Anthropic::ToolUseBlockParam::Caller::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::ToolUseBlockParam::Caller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::ToolUseBlockParam::Caller::Type::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::ToolUseBlockParam::Caller::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::ToolUseBlockParam::Caller::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::ToolUseBlockParam::Caller::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String), tool_id: String).returns(
            Anthropic::ToolUseBlockParam::Caller::Variants
          )
        end
        def self.new(type:, tool_id: nil)
        end
      end
    end
  end
end
