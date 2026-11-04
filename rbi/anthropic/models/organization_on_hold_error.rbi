# typed: strong

module Anthropic
  module Models
    # Anthropic has disabled the organization for trust and safety reasons. An
    # organization disabled for any other reason, such as billing, does not get this
    # code. `appeal_url`, when present, is where the organization can appeal.
    class OrganizationOnHoldError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::OrganizationOnHoldErrorDetails) }
      def details
      end
    end
  end
end
