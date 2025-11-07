# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      class BaseTool
        include Anthropic::Internal::Type::Converter
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        class << self
          # @api public
          #
          # @return [Class<Anthropic::Helpers::InputSchema::BaseModel>]
          attr_reader :model

          # @return [String]
          attr_reader :doc_string

          # @api public
          #
          # @param description [String]
          def description(description) = (@doc_string = description)

          alias_method :doc, :description

          # @api public
          #
          # @model [Class<Anthropic::Helpers::InputSchema::BaseModel>]
          def input_schema(model) = (@model = model)

          # @api private
          #
          # @param depth [Integer]
          def inspect(depth: 0) = "#{name}[#{model.inspect(depth:)}]"
        end

        # @api private
        #
        def to_json_schema_inner(state:) = self.class.model&.to_json_schema_inner(state:)

        # @api private
        #
        def to_json_schema = self.class.model&.to_json_schema

        # @api private
        #
        def dump(value, state:)
          Anthropic::Internal::Type::Converter.dump(self.class.model, value, state:)
        end

        # @api private
        #
        def coerce(value, state:)
          parsed = parse(value)
          Anthropic::Internal::Type::Converter.coerce(self.class.model, parsed, state:)
        end

        # rubocop:disable Lint/UnusedMethodArgument

        # @api public
        #
        # Override the `#parse` method to customize the pre-processing of the tool call argument
        #
        # @param value [Object]
        #
        # @return [Object]
        def parse(value) = value

        # @api public
        #
        # @param parsed [Anthropic::Helpers::InputSchema::BaseModel]
        def call(parsed) = raise NotImplementedError.new

        # rubocop:enable Lint/UnusedMethodArgument

        # @api private
        #
        def inspect = "#<#{self.class.inspect(depth: 1)}:0x#{object_id.to_s(16)}>"
      end
    end
  end
end
