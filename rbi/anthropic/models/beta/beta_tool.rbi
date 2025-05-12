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

        sig { returns(T.nilable(Anthropic::Beta::BetaTool::Type::OrSymbol)) }
        attr_accessor :type

        sig do
          params(
            input_schema: Anthropic::Beta::BetaTool::InputSchema::OrHash,
            name: String,
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            description: String,
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
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Description of what this tool does.
          #
          # Tool descriptions should be as detailed as possible. The more information that
          # the model has about what the tool is and how to use it, the better it will
          # perform. You can use natural language descriptions to reinforce important
          # aspects of the tool input JSON schema.
          description: nil,
          type: nil
        )
        end

        sig do
          override.returns(
            {
              input_schema: Anthropic::Beta::BetaTool::InputSchema,
              name: String,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              description: String,
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

          sig { returns(T.nilable(T.anything)) }
          attr_accessor :properties

          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model
          # will produce.
          sig do
            params(properties: T.nilable(T.anything), type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(properties: nil, type: :object)
          end

          sig do
            override.returns(
              { type: Symbol, properties: T.nilable(T.anything) }
            )
          end
          def to_hash
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
