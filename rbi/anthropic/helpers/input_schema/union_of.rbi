# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      # @example
      #   example = Anthropic::UnionOf[Float, Anthropic::ArrayOf[Integer]]
      class UnionOf
        include Anthropic::Internal::Type::Union
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        sig do
          params(
            variants:
              Anthropic::Helpers::InputSchema::JsonSchemaConverter::Input
          ).returns(T.attached_class)
        end
        def self.[](*variants)
        end
      end
    end
  end
end
