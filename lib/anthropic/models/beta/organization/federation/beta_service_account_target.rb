# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaServiceAccountTarget < Anthropic::Internal::Type::BaseModel
            # @!attribute service_account_id
            #   Tagged ID of the service account to mint tokens for.
            #
            #   @return [String]
            required :service_account_id, String

            # @!attribute type
            #
            #   @return [Symbol, :service_account]
            required :type, const: :service_account

            # @!attribute service_account_name
            #   Service account's display name at read time. Ignored on writes.
            #
            #   @return [String, nil]
            optional :service_account_name, String, nil?: true

            # @!method initialize(service_account_id:, service_account_name: nil, type: :service_account)
            #   Bind to a fixed service account by ID.
            #
            #   @param service_account_id [String] Tagged ID of the service account to mint tokens for.
            #
            #   @param service_account_name [String, nil] Service account's display name at read time. Ignored on writes.
            #
            #   @param type [Symbol, :service_account]
          end
        end
      end
    end
  end
end
