# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      # @generic Member
      #
      # @example
      #   example = Anthropic::UnionOf[Float, Anthropic::ArrayOf[Integer]]
      class UnionOf
        include Anthropic::Internal::Type::Union
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
            path = state.fetch(:path)
            mergeable_keys = {[:anyOf] => 0, [:type] => 0}
            schemas = variants.to_enum.with_index.map do
              new_state = {**state, path: [*path, "?.#{_2}"]}
              Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema_inner(
                _1,
                state: new_state
              )
            end

            schemas.each do |schema|
              mergeable_keys.each_key { mergeable_keys[_1] += 1 if schema.keys == _1 }
            end
            mergeable = mergeable_keys.any? { _1.last == schemas.length }
            mergeable ? Anthropic::Internal::Util.deep_merge(*schemas, concat: true) : {anyOf: schemas}
          end
        end

        private_class_method :new

        def self.[](...) = new(...)

        # @param variants [Array<generic<Member>>]
        def initialize(*variants)
          variants.each do |v|
            v.is_a?(Proc) ? variant(v) : variant(-> { v })
          end
        end
      end
    end
  end
end
