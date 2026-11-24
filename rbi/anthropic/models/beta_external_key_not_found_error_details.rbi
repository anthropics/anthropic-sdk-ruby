# typed: strong

module Anthropic
  module Models
    class BetaExternalKeyNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaExternalKeyNotFoundErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization has no active External Key with this ID. The message names the
      # field.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :external_key_not_found)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
