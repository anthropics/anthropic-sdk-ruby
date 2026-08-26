# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#list
        class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute after_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          #
          #   @return [String, nil]
          optional :after_id, String

          # @!attribute before_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately before this object.
          #
          #   @return [String, nil]
          optional :before_id, String

          # @!attribute include_archived
          #   Whether to include Workspaces that have been archived in the response
          #
          #   @return [Boolean, nil]
          optional :include_archived, Anthropic::Internal::Type::Boolean

          # @!attribute limit
          #   Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!method initialize(after_id: nil, before_id: nil, include_archived: nil, limit: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WorkspaceListParams} for more details.
          #
          #   @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param include_archived [Boolean] Whether to include Workspaces that have been archived in the response
          #
          #   @param limit [Integer] Number of items to return per page.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
