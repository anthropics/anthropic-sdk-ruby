# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBillingPolicy < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :billing_policy]
        required :type, const: :billing_policy

        # @!attribute bill_to
        #   Who is billed. `self`, the default, bills your organization, as if
        #   `billing_policy` were omitted. `user_profile` bills the customer behind the user
        #   profile the request names; if that customer has not linked an Anthropic
        #   organization to the profile, or has not allowed your organization to bill it,
        #   the request is rejected rather than billed to you.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBillTo, nil]
        optional :bill_to, enum: -> { Anthropic::Beta::BetaBillTo }

        # @!method initialize(bill_to: nil, type: :billing_policy)
        #   Declares which organization is billed for the request.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBillingPolicy} for more details.
        #
        #   @param bill_to [Symbol, Anthropic::Models::Beta::BetaBillTo] Who is billed. `self`, the default, bills your organization, as if
        #
        #   @param type [Symbol, :billing_policy]
      end
    end

    BetaBillingPolicy = Beta::BetaBillingPolicy
  end
end
