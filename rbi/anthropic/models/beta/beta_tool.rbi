# typed: strong

module Anthropic
  module Models
    BetaTool = Beta::BetaTool

    module Beta
      class BetaTool < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaTool, Anthropic::Internal::AnyHash)
          end

        # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        # This defines the shape of the `input` that your tool accepts and that the model
        # will produce.
        sig { returns(Anthropic::Beta::BetaTool::InputSchema) }
        attr_reader :input_schema

        sig do
          params(
            input_schema: Anthropic::Beta::BetaTool::InputSchema::OrHash
          ).void
        end
        attr_writer :input_schema

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(String) }
        attr_accessor :name

        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaTool::AllowedCaller::OrSymbol]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[Anthropic::Beta::BetaTool::AllowedCaller::OrSymbol]
          ).void
        end
        attr_writer :allowed_callers

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # Description of what this tool does.
        #
        # Tool descriptions should be as detailed as possible. The more information that
        # the model has about what the tool is and how to use it, the better it will
        # perform. You can use natural language descriptions to reinforce important
        # aspects of the tool input JSON schema.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
        attr_reader :input_examples

        sig do
          params(input_examples: T::Array[T::Hash[Symbol, T.anything]]).void
        end
        attr_writer :input_examples

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig { returns(T.nilable(Anthropic::Beta::BetaTool::Type::OrSymbol)) }
        attr_accessor :type

        sig do
          params(
            input_schema: Anthropic::Beta::BetaTool::InputSchema::OrHash,
            name: String,
            allowed_callers:
              T::Array[Anthropic::Beta::BetaTool::AllowedCaller::OrSymbol],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            description: String,
            input_examples: T::Array[T::Hash[Symbol, T.anything]],
            strict: T::Boolean,
            type: T.nilable(Anthropic::Beta::BetaTool::Type::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model
          # will produce.
          input_schema:,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name:,
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # Description of what this tool does.
          #
          # Tool descriptions should be as detailed as possible. The more information that
          # the model has about what the tool is and how to use it, the better it will
          # perform. You can use natural language descriptions to reinforce important
          # aspects of the tool input JSON schema.
          description: nil,
          input_examples: nil,
          strict: nil,
          type: nil
        )
        end

        sig do
          override.returns(
            {
              input_schema: Anthropic::Beta::BetaTool::InputSchema,
              name: String,
              allowed_callers:
                T::Array[Anthropic::Beta::BetaTool::AllowedCaller::OrSymbol],
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              defer_loading: T::Boolean,
              description: String,
              input_examples: T::Array[T::Hash[Symbol, T.anything]],
              strict: T::Boolean,
              type: T.nilable(Anthropic::Beta::BetaTool::Type::OrSymbol)
            }
          )
        end
        def to_hash
        end

        class InputSchema < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaTool::InputSchema,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_accessor :properties

          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :required

          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model
          # will produce.
          sig do
            params(
              properties: T.nilable(T::Hash[Symbol, T.anything]),
              required: T.nilable(T::Array[String]),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(properties: nil, required: nil, type: :object)
          end

          sig do
            override.returns(
              {
                type: Symbol,
                properties: T.nilable(T::Hash[Symbol, T.anything]),
                required: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaTool::AllowedCaller)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaTool::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaTool::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaTool::AllowedCaller::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Beta::BetaTool::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM = T.let(:custom, Anthropic::Beta::BetaTool::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaTool::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
