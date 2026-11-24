# typed: strong

module Anthropic
  module Models
    # Anthropic has not approved keeping data in a customer-owned storage bucket for
    # the organization, project or user profile this request applies to, or has paused
    # or withdrawn its approval. If you did not expect this, contact Anthropic.
    class BetaStorageNotApprovedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaStorageNotApprovedErrorDetails) }
      def details
      end
    end
  end
end
