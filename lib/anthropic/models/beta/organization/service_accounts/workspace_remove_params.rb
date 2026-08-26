# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ServiceAccounts
          # @see Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces#remove
          class WorkspaceRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute service_account_id
            #   ID of the service account.
            #
            #   @return [String]
            required :service_account_id, String

            # @!attribute workspace_id
            #   ID of the workspace.
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(service_account_id:, workspace_id:, betas: nil, request_options: {})
            #   @param service_account_id [String] ID of the service account.
            #
            #   @param workspace_id [String] ID of the workspace.
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
