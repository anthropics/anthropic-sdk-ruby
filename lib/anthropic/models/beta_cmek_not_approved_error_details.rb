# frozen_string_literal: true

module Anthropic
  module Models
    class BetaCMEKNotApprovedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_not_approved]
      required :error_code, const: :cmek_not_approved

      # @!method initialize(error_code: :cmek_not_approved)
      #   Anthropic has not approved customer-managed encryption keys for the
      #   organization, project or user profile this request applies to, or has paused or
      #   withdrawn its approval. If you did not expect this, contact Anthropic.
      #
      #   @param error_code [Symbol, :cmek_not_approved]
    end
  end
end
