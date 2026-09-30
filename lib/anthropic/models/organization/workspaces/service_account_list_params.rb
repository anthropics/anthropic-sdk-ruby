# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # @see Anthropic::Resources::Organization::Workspaces::ServiceAccounts#list
        class ServiceAccountListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #   ID of the workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute limit
          #   Number of results per page.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute page
          #   Opaque cursor from a previous response's `next_page`.
          #
          #   @return [String, nil]
          optional :page, String, nil?: true

          # @!method initialize(workspace_id:, limit: nil, page: nil, request_options: {})
          #   @param workspace_id [String] ID of the workspace.
          #
          #   @param limit [Integer] Number of results per page.
          #
          #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
