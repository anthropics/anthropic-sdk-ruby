# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module ServiceAccounts
        # @see Anthropic::Resources::Organization::ServiceAccounts::Workspaces#remove
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

          # @!method initialize(service_account_id:, workspace_id:, request_options: {})
          #   @param service_account_id [String] ID of the service account.
          #
          #   @param workspace_id [String] ID of the workspace.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
