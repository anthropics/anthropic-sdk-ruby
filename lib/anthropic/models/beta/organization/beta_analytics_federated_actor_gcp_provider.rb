# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorGCPProvider < Anthropic::Internal::Type::BaseModel
          # @!attribute project_number
          #   The Google Cloud project the organization is bound to.
          #
          #   @return [String]
          required :project_number, String

          # @!attribute type
          #
          #   @return [Symbol, :gcp]
          required :type, const: :gcp

          # @!method initialize(project_number:, type: :gcp)
          #   @param project_number [String] The Google Cloud project the organization is bound to.
          #
          #   @param type [Symbol, :gcp]
        end
      end
    end
  end
end
