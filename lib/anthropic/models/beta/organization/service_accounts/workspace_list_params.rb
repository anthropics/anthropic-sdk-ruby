# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ServiceAccounts
          # @see Anthropic::Resources::Beta::Organization::ServiceAccounts::Workspaces#list
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

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(service_account_id:, limit: nil, page: nil, betas: nil, request_options: {})
            #   @param service_account_id [String] ID of the service account.
            #
            #   @param limit [Integer] Number of results per page.
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
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
