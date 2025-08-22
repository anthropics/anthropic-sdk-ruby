# typed: strong

module Anthropic
  module Helpers
    module InputSchema
      # @example
      #   example = Anthropic::EnumOf[:foo, :bar, :zoo]
      #
      # @example
      #   example = Anthropic::EnumOf[1, 2, 3]
      class EnumOf
        include Anthropic::Internal::Type::Enum
        include Anthropic::Helpers::InputSchema::JsonSchemaConverter

        sig do
          params(
            values: T.any(NilClass, T::Boolean, Integer, Float, Symbol)
          ).returns(T.attached_class)
        end
        def self.[](*values)
        end

        sig do
          returns(T::Array[T.any(NilClass, T::Boolean, Integer, Float, Symbol)])
        end
        attr_reader :values
      end
    end
  end
end
