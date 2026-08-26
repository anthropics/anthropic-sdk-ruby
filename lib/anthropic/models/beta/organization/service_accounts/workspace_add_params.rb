# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ServiceAccounts
          # @see Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces#add
          class WorkspaceAddParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute service_account_id
            #   ID of the service account.
            #
            #   @return [String]
            required :service_account_id, String

            # @!attribute workspace_id
            #   Tagged workspace ID to add the service account to.
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute workspace_role
            #   Role to assign to the service account in this workspace.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole]
            required :workspace_role, enum: -> { Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole }

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(service_account_id:, workspace_id:, workspace_role:, betas: nil, request_options: {})
            #   @param service_account_id [String] ID of the service account.
            #
            #   @param workspace_id [String] Tagged workspace ID to add the service account to.
            #
            #   @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole] Role to assign to the service account in this workspace.
            #
            #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
