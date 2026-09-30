# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # @see Anthropic::Resources::Organization::Workspaces::ServiceAccounts#remove
        class ServiceAccountRemoveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #   ID of the workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute service_account_id
          #   ID of the service account.
          #
          #   @return [String]
          required :service_account_id, String

          # @!method initialize(workspace_id:, service_account_id:, request_options: {})
          #   @param workspace_id [String] ID of the workspace.
          #
          #   @param service_account_id [String] ID of the service account.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
