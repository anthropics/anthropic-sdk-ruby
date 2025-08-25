# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      # @generic Value
      #
      # @example
      #   example = Anthropic::EnumOf[:foo, :bar, :zoo]
      #
      # @example
      #   example = Anthropic::EnumOf[1, 2, 3]
      class EnumOf
        include Anthropic::Internal::Type::Enum
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        # @api private
        #
        # @param state [Hash{Symbol=>Object}]
        #
        #   @option state [Hash{Object=>String}] :defs
        #
        #   @option state [Array<String>] :path
        #
        # @return [Hash{Symbol=>Object}]
        def to_json_schema_inner(state:)
          Anthropic::Helpers::InputSchema::JsonSchemaConverter.cache_def!(state, type: self) do
            types = values.map do
              case _1
              in NilClass
                "null"
              in true | false
                "boolean"
              in Integer
                "integer"
              in Float
                "number"
              in Symbol
                "string"
              end
            end
              .uniq

            {
              type: types.length == 1 ? types.first : types,
              enum: values.map { _1.is_a?(Symbol) ? _1.to_s : _1 }
            }
          end
        end

        private_class_method :new

        def self.[](...) = new(...)

        # @return [Array<generic<Value>>]
        attr_reader :values

        # @param values [Array<generic<Value>>]
        def initialize(*values) = (@values = values.map { _1.is_a?(String) ? _1.to_sym : _1 })
      end
    end
  end
end
