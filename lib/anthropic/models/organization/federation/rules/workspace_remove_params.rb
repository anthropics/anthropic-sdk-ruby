# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Federation
        module Rules
          # @see Anthropic::Resources::Organization::Federation::Rules::Workspaces#remove
          class WorkspaceRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute federation_rule_id
            #   ID of the federation rule.
            #
            #   @return [String]
            required :federation_rule_id, String

            # @!attribute workspace_id
            #   ID of the workspace to disable for.
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(federation_rule_id:, workspace_id:, request_options: {})
            #   @param federation_rule_id [String] ID of the federation rule.
            #
            #   @param workspace_id [String] ID of the workspace to disable for.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
