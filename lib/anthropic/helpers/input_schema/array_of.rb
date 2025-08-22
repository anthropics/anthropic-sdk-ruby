# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      # @generic Elem
      #
      # @example
      #   example = Anthropic::ArrayOf[Integer]
      #
      # @example
      #   example = Anthropic::ArrayOf[Integer, nil?: true, doc: "hi there!"]
      class ArrayOf < Anthropic::Internal::Type::ArrayOf
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
            state.fetch(:path) << "[]"
            items = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_json_schema_inner(
              item_type,
              state: state
            )
            items = Anthropic::Helpers::InputSchema::JsonSchemaConverter.to_nilable(items) if nilable?
            Anthropic::Helpers::InputSchema::JsonSchemaConverter.assoc_meta!(items, meta: @meta)

            {type: "array", items: items}
          end
        end
      end
    end
  end
end
