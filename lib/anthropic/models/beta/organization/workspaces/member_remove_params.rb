# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::Members#remove
          class MemberRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute workspace_id
            #   ID of the Workspace.
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute user_id
            #   ID of the User.
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(workspace_id:, user_id:, request_options: {})
            #   @param workspace_id [String] ID of the Workspace.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
