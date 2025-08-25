# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      class ArrayOf < Anthropic::Internal::Type::ArrayOf
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        Elem = type_member(:out)

        sig { returns(String) }
        attr_reader :description
      end
    end
  end
end
