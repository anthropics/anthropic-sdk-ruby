# frozen_string_literal: true

module Anthropic
  module Helpers
    module InputSchema
      # rubocop:disable Style/MutableConstant
      PROPERTY_MAPPING = {
        # Numeric properties:
        minimum: :minimum,
        maximum: :maximum,
        exclusive_minimum: :exclusiveMinimum,
        exclusive_maximum: :exclusiveMaximum,
        multiple_of: :multipleOf,

        # String properties:
        min_length: :minLength,
        max_length: :maxLength,
        pattern: :pattern,
        format: :format,
        content_media_type: :contentMediaType,
        content_encoding: :contentEncoding,

        # Array properties:
        min_items: :minItems,
        max_items: :maxItems,
        unique_items: :uniqueItems,
        prefix_items: :prefixItems,
        contains: :contains,
        min_contains: :minContains,
        max_contains: :maxContains,

        # Object properties:
        pattern_properties: :patternProperties,
        dependent_schemas: :dependentSchemas,
        dependent_required: :dependentRequired,
        property_names: :propertyNames,

        # Metadata:
        default: :default,
        examples: :examples,

        doc: :description
      }
      # rubocop:enable Style/MutableConstant
    end
  end
end
