# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::APIKeys#list
        class APIKeyListParams < Anthropic::Internal::Type::BaseModel
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

          # @!attribute created_by_user_id
          #   Filter by the ID of the User who created the object.
          #
          #   @return [String, nil]
          optional :created_by_user_id, String, nil?: true

          # @!attribute limit
          #   Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute status
          #   Filter by API key status.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::APIKeyListParams::Status, nil]
          optional :status, enum: -> { Anthropic::Beta::Organization::APIKeyListParams::Status }, nil?: true

          # @!attribute workspace_id
          #   Filter by Workspace ID.
          #
          #   @return [String, nil]
          optional :workspace_id, String, nil?: true

          # @!method initialize(after_id: nil, before_id: nil, created_by_user_id: nil, limit: nil, status: nil, workspace_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::APIKeyListParams} for more details.
          #
          #   @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param created_by_user_id [String, nil] Filter by the ID of the User who created the object.
          #
          #   @param limit [Integer] Number of items to return per page.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::APIKeyListParams::Status, nil] Filter by API key status.
          #
          #   @param workspace_id [String, nil] Filter by Workspace ID.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Filter by API key status.
          module Status
            extend Anthropic::Internal::Type::Enum

            ACTIVE = :active
            ARCHIVED = :archived
            EXPIRED = :expired
            INACTIVE = :inactive

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
