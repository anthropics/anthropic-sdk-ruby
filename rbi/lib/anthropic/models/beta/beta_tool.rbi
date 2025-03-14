# typed: strong

module Anthropic
  module Models
    BetaTool = T.type_alias { Beta::BetaTool }

    module Beta
      class BetaTool < Anthropic::BaseModel
        # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
        #
        #   This defines the shape of the `input` that your tool accepts and that the model
        #   will produce.
        sig { returns(Anthropic::Models::Beta::BetaTool::InputSchema) }
        def input_schema
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaTool::InputSchema)
            .returns(Anthropic::Models::Beta::BetaTool::InputSchema)
        end
        def input_schema=(_)
        end

        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        sig { returns(String) }
        def name
        end

        sig { params(_: String).returns(String) }
        def name=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

        # Description of what this tool does.
        #
        #   Tool descriptions should be as detailed as possible. The more information that
        #   the model has about what the tool is and how to use it, the better it will
        #   perform. You can use natural language descriptions to reinforce important
        #   aspects of the tool input JSON schema.
        sig { returns(T.nilable(String)) }
        def description
        end

        sig { params(_: String).returns(String) }
        def description=(_)
        end

        sig { returns(T.nilable(Symbol)) }
        def type
        end

        sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
        def type=(_)
        end

        sig do
          params(
            input_schema: Anthropic::Models::Beta::BetaTool::InputSchema,
            name: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            description: String,
            type: T.nilable(Symbol)
          )
            .returns(T.attached_class)
        end
        def self.new(input_schema:, name:, cache_control: nil, description: nil, type: nil)
        end

        sig do
          override
            .returns(
              {
                input_schema: Anthropic::Models::Beta::BetaTool::InputSchema,
                name: String,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
                description: String,
                type: T.nilable(Symbol)
              }
            )
        end
        def to_hash
        end

        class InputSchema < Anthropic::BaseModel
          sig { returns(Symbol) }
          def type
          end

          sig { params(_: Symbol).returns(Symbol) }
          def type=(_)
          end

          sig { returns(T.nilable(T.anything)) }
          def properties
          end

          sig { params(_: T.nilable(T.anything)).returns(T.nilable(T.anything)) }
          def properties=(_)
          end

          # [JSON schema](https://json-schema.org/draft/2020-12) for this tool's input.
          #
          #   This defines the shape of the `input` that your tool accepts and that the model
          #   will produce.
          sig { params(properties: T.nilable(T.anything), type: Symbol).returns(T.attached_class) }
          def self.new(properties: nil, type: :object)
          end

          sig { override.returns({type: Symbol, properties: T.nilable(T.anything)}) }
          def to_hash
          end
        end

        class Type < Anthropic::Enum
          abstract!

          CUSTOM = T.let(:custom, T.nilable(Symbol))

          class << self
            sig { override.returns(T::Array[Symbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
