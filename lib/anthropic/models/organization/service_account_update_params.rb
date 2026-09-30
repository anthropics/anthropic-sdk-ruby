# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ServiceAccounts#update
      class ServiceAccountUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute service_account_id
        #   ID of the service account to update.
        #
        #   @return [String]
        required :service_account_id, String

        # @!attribute description
        #   Replaces the description. Omit to leave unchanged; send `null` to clear (the
        #   field is stored as an empty string).
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute organization_role
        #   Replaces the org-level role. Omit or send `null` to leave unchanged.
        #
        #   @return [Symbol, Anthropic::Models::Organization::ServiceAccountUpdateParams::OrganizationRole, nil]
        optional :organization_role,
                 enum: -> { Anthropic::Organization::ServiceAccountUpdateParams::OrganizationRole },
                 nil?: true

        # @!method initialize(service_account_id:, description: nil, organization_role: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::ServiceAccountUpdateParams} for more details.
        #
        #   @param service_account_id [String] ID of the service account to update.
        #
        #   @param description [String, nil] Replaces the description. Omit to leave unchanged; send `null` to clear (the fie
        #
        #   @param organization_role [Symbol, Anthropic::Models::Organization::ServiceAccountUpdateParams::OrganizationRole, nil] Replaces the org-level role. Omit or send `null` to leave unchanged.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Replaces the org-level role. Omit or send `null` to leave unchanged.
        module OrganizationRole
          extend Anthropic::Internal::Type::Enum

          ADMIN = :admin
          DEVELOPER = :developer

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
