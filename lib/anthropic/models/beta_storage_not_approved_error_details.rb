# frozen_string_literal: true

module Anthropic
  module Models
    class BetaStorageNotApprovedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :storage_not_approved]
      required :error_code, const: :storage_not_approved

      # @!method initialize(error_code: :storage_not_approved)
      #   Anthropic has not approved keeping data in a customer-owned storage bucket for
      #   the organization, project or user profile this request applies to, or has paused
      #   or withdrawn its approval. If you did not expect this, contact Anthropic.
      #
      #   @param error_code [Symbol, :storage_not_approved]
    end
  end
end
