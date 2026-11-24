# typed: strong

module Anthropic
  module Models
    # Anthropic has not approved customer-managed encryption keys for the
    # organization, project or user profile this request applies to, or has paused or
    # withdrawn its approval. If you did not expect this, contact Anthropic.
    class BetaCMEKNotApprovedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaCMEKNotApprovedErrorDetails) }
      def details
      end
    end
  end
end
