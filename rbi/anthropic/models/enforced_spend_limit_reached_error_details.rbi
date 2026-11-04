# typed: strong

module Anthropic
  module Models
    class EnforcedSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::EnforcedSpendLimitReachedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization has crossed the monthly API usage threshold of its API tier.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :enforced_spend_limit_reached)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
