# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#create
        class BetaWorkspace < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the Workspace.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   RFC 3339 datetime string indicating when the Workspace was archived, or `null`
          #   if the Workspace is not archived.
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute compartment_id
          #   Identifier for this Workspace's encryption compartment. When you configure a
          #   customer-managed encryption key (CMEK) on AWS, reference this value in your KMS
          #   key-policy condition so the key is scoped to this compartment. On GCP and Azure,
          #   Anthropic enforces the compartment binding automatically; you do not need to
          #   reference this value in your key configuration. See the CMEK integration guide
          #   for the required key configuration, including the value used during key
          #   validation.
          #
          #   @return [String]
          required :compartment_id, String

          # @!attribute created_at
          #   RFC 3339 datetime string indicating when the Workspace was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute data_residency
          #   Data residency configuration.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaDataResidency]
          required :data_residency, -> { Anthropic::Beta::Organization::BetaDataResidency }

          # @!attribute display_color
          #   Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @return [String]
          required :display_color, String

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
          required :external_key_id, String, nil?: true

          # @!attribute name
          #   Name of the Workspace.
          #
          #   @return [String]
          required :name, String

          # @!attribute tags
          #   User-defined tags as string key-value pairs. Keys may not begin with
          #   `anthropic`.
          #
          #   @return [Hash{Symbol=>String}]
          required :tags, Anthropic::Internal::Type::HashOf[String]

          # @!attribute type
          #   Object type.
          #
          #   For Workspaces, this is always `"workspace"`.
          #
          #   @return [Symbol, :workspace]
          required :type, const: :workspace

          # @!method initialize(id:, archived_at:, compartment_id:, created_at:, data_residency:, display_color:, external_key_id:, name:, tags:, type: :workspace)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaWorkspace} for more details.
          #
          #   @param id [String] ID of the Workspace.
          #
          #   @param archived_at [Time, nil] RFC 3339 datetime string indicating when the Workspace was archived, or `null` i
          #
          #   @param compartment_id [String] Identifier for this Workspace's encryption compartment. When you configure a
          #
          #   @param created_at [Time] RFC 3339 datetime string indicating when the Workspace was created.
          #
          #   @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidency] Data residency configuration.
          #
          #   @param display_color [String] Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @param external_key_id [String, nil] ID of the customer-managed encryption key (CMEK) configuration to use for this
          #
          #   @param name [String] Name of the Workspace.
          #
          #   @param tags [Hash{Symbol=>String}] User-defined tags as string key-value pairs. Keys may not begin with `anthropic`
          #
          #   @param type [Symbol, :workspace] Object type.
        end
      end
    end
  end
end
