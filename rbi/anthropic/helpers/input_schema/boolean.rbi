# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      class Boolean < Anthropic::Internal::Type::Boolean
        extend Anthropic::Helpers::InputSchema::JsonSchemaConverter
      end
    end
  end
end
