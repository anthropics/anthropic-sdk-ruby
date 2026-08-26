# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ServiceAccounts#create
        class ServiceAccountCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute name
          #   Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #   duplicate name returns 409.
          #
          #   @return [String]
          required :name, String

          # @!attribute description
          #   Optional free-text description.
          #
          #   @return [String, nil]
          optional :description, String, nil?: true

          # @!attribute organization_role
          #   Org-level role. Defaults to `developer`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::ServiceAccountCreateParams::OrganizationRole, nil]
          optional :organization_role,
                   enum: -> { Anthropic::Beta::Organization::ServiceAccountCreateParams::OrganizationRole }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(name:, description: nil, organization_role: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ServiceAccountCreateParams} for more
          #   details.
          #
          #   @param name [String] Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          #
          #   @param description [String, nil] Optional free-text description.
          #
          #   @param organization_role [Symbol, Anthropic::Models::Beta::Organization::ServiceAccountCreateParams::OrganizationRole] Org-level role. Defaults to `developer`.
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Org-level role. Defaults to `developer`.
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
end
