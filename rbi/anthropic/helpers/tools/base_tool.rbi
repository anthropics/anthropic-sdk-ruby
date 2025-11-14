# typed: strong

module Anthropic
  module Helpers
    module Tools
      # @api private
      #
      class BaseTool
        include Anthropic::Internal::Type::Converter
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        class << self
          # @api public
          #
          sig do
            returns(T.class_of(Anthropic::Helpers::InputSchema::BaseModel))
          end
          attr_reader :model

          sig { returns(T.class_of(String)) }
          attr_reader :doc_string

          # @api public
          #
          sig { params(description: String).returns(T.class_of(String)) }
          def description(description)
          end

          alias_method :doc, :description

          # @api public
          #
          sig do
            params(
              model: T.class_of(Anthropic::Helpers::InputSchema::BaseModel)
            ).returns(T.class_of(Anthropic::Helpers::InputSchema::BaseModel))
          end
          def input_schema(model) = (@model = model)
        end

        # @api public
        #
        # Override the `#parse` method to customize the pre-processing of the tool call argument
        #
        sig { params(value: T.anything).returns(T.anything) }
        def parse(value)
        end

        # @api public
        #
        sig do
          params(parsed: Anthropic::Helpers::InputSchema::BaseModel).returns(
            T.anything
          )
        end
        def call(parsed)
        end
      end
    end
  end
end
