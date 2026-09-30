# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module ServiceAccounts
        # @see Anthropic::Resources::Organization::ServiceAccounts::Workspaces#list
        class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute service_account_id
          #   ID of the service account.
          #
          #   @return [String]
          required :service_account_id, String

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

          # @!method initialize(service_account_id:, limit: nil, page: nil, request_options: {})
          #   @param service_account_id [String] ID of the service account.
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
