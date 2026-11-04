# typed: strong

module Anthropic
  module Models
    BetaBillingFrozenErrorDetails = Beta::BetaBillingFrozenErrorDetails

    module Beta
      class BetaBillingFrozenErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBillingFrozenErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # Anthropic has temporarily disabled billing changes for the user account the
        # credential belongs to. Contact support.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :billing_frozen)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
