# typed: strong

module Anthropic
  module Models
    BetaBillingPolicy = Beta::BetaBillingPolicy

    module Beta
      class BetaBillingPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBillingPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Who is billed. `self`, the default, bills your organization, as if
        # `billing_policy` were omitted. `user_profile` bills the customer behind the user
        # profile the request names; if that customer has not linked an Anthropic
        # organization to the profile, or has not allowed your organization to bill it,
        # the request is rejected rather than billed to you.
        sig { returns(T.nilable(Anthropic::Beta::BetaBillTo::OrSymbol)) }
        attr_reader :bill_to

        sig { params(bill_to: Anthropic::Beta::BetaBillTo::OrSymbol).void }
        attr_writer :bill_to

        # Declares which organization is billed for the request.
        sig do
          params(
            bill_to: Anthropic::Beta::BetaBillTo::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Who is billed. `self`, the default, bills your organization, as if
          # `billing_policy` were omitted. `user_profile` bills the customer behind the user
          # profile the request names; if that customer has not linked an Anthropic
          # organization to the profile, or has not allowed your organization to bill it,
          # the request is rejected rather than billed to you.
          bill_to: nil,
          type: :billing_policy
        )
        end

        sig do
          override.returns(
            { type: Symbol, bill_to: Anthropic::Beta::BetaBillTo::OrSymbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
