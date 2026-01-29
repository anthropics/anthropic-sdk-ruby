# typed: strong

module Anthropic
  module Models
    class JSONOutputFormat < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::JSONOutputFormat, Anthropic::Internal::AnyHash)
        end

      # The JSON schema of the format
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :schema

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(schema: T::Hash[Symbol, T.anything], type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # The JSON schema of the format
        schema:,
        type: :json_schema
      )
      end

      sig do
        override.returns({ schema: T::Hash[Symbol, T.anything], type: Symbol })
      end
      def to_hash
      end
    end
  end
end
