# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#update
        class WorkspaceUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute data_residency
          #   Data residency configuration for the workspace.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig, nil]
          optional :data_residency,
                   -> {
                     Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig
                   },
                   nil?: true

          # @!attribute display_color
          #   Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @return [String, nil]
          optional :display_color, String

          # @!attribute external_key_id
          #   ID of the customer-managed encryption key (CMEK) configuration to use for this
          #   Workspace. Setting this field requires CMEK to be enabled for your organization.
          #   When set, data stored for this Workspace is encrypted with the referenced key.
          #   Create key configurations with the External Keys API. This field is write-once:
          #   once a key is attached to a Workspace it cannot be detached or replaced. To
          #   rotate key material, rotate the underlying key on your cloud KMS; the
          #   `external_key_id` stays the same.
          #
          #   @return [String, nil]
          optional :external_key_id, String

          # @!attribute name
          #   Name of the Workspace.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute tags
          #   User-defined tags as string key-value pairs. Keys may not begin with
          #   `anthropic`.
          #
          #   @return [Hash{Symbol=>String, nil}, nil]
          optional :tags, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

          # @!method initialize(workspace_id:, data_residency: nil, display_color: nil, external_key_id: nil, name: nil, tags: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WorkspaceUpdateParams} for more details.
          #
          #   @param workspace_id [String]
          #
          #   @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig, nil] Data residency configuration for the workspace.
          #
          #   @param display_color [String] Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @param external_key_id [String] ID of the customer-managed encryption key (CMEK) configuration to use for this
          #
          #   @param name [String] Name of the Workspace.
          #
          #   @param tags [Hash{Symbol=>String, nil}, nil] User-defined tags as string key-value pairs. Keys may not begin with `anthropic`
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
