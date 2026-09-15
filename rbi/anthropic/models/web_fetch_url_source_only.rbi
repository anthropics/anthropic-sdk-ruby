# typed: strong

module Anthropic
  module Models
    class WebFetchURLSourceOnly < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebFetchURLSourceOnly, Anthropic::Internal::AnyHash)
        end

      sig { returns(T::Array[Anthropic::WebFetchURLSourceToolReference]) }
      attr_accessor :tools

      sig { returns(Symbol) }
      attr_accessor :type

      # The tool filter variant under which only the named tools' results contribute.
      sig do
        params(
          tools: T::Array[Anthropic::WebFetchURLSourceToolReference::OrHash],
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(tools:, type: :only)
      end

      sig do
        override.returns(
          {
            tools: T::Array[Anthropic::WebFetchURLSourceToolReference],
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
