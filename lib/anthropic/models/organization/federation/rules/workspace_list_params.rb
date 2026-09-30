# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        module Rules
          # @see Anthropic::Resources::Organization::Federation::Rules::Workspaces#list
          class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute federation_rule_id
            #   ID of the federation rule.
            #
            #   @return [String]
            required :federation_rule_id, String

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

            # @!method initialize(federation_rule_id:, limit: nil, page: nil, request_options: {})
            #   @param federation_rule_id [String] ID of the federation rule.
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
end
