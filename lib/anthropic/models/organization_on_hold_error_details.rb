# frozen_string_literal: true

module Anthropic
  module Models
    class OrganizationOnHoldErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :organization_on_hold]
      required :error_code, const: :organization_on_hold

      # @!attribute appeal_url
      #
      #   @return [String, nil]
      optional :appeal_url, String, nil?: true

      # @!method initialize(appeal_url: nil, error_code: :organization_on_hold)
      #   Anthropic has disabled the organization for trust and safety reasons. An
      #   organization disabled for any other reason, such as billing, does not get this
      #   code. `appeal_url`, when present, is where the organization can appeal.
      #
      #   @param appeal_url [String, nil]
      #   @param error_code [Symbol, :organization_on_hold]
    end
  end
end
