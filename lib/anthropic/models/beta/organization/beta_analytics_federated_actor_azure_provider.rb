# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorAzureProvider < Anthropic::Internal::Type::BaseModel
          # @!attribute subscription_id
          #   The Azure subscription the organization is bound to.
          #
          #   @return [String]
          required :subscription_id, String

          # @!attribute type
          #
          #   @return [Symbol, :azure]
          required :type, const: :azure

          # @!method initialize(subscription_id:, type: :azure)
          #   @param subscription_id [String] The Azure subscription the organization is bound to.
          #
          #   @param type [Symbol, :azure]
        end
      end
    end
  end
end
