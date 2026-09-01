# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#create
        class WorkspaceCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute name
          #   Name of the Workspace.
          #
          #   @return [String]
          required :name, String

          # @!attribute data_residency
          #   Data residency configuration for the workspace. If omitted, defaults to
          #   `workspace_geo: "us"`, `allowed_inference_geos: "unrestricted"`, and
          #   `default_inference_geo: "global"`.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig, nil]
          optional :data_residency,
                   -> {
                     Anthropic::Beta::Organization::BetaDataResidencyCreateConfig
                   },
                   nil?: true

          # @!attribute display_color
          #   Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @return [String, nil]
          optional :display_color, String, nil?: true

          # @!attribute external_key_id
          #   ID of the customer-managed encryption key (CMEK) configuration to use for this
          #   Workspace. Setting this field requires CMEK to be enabled for your organization.
          #   When set, data stored for this Workspace is encrypted with the referenced key.
          #   Create key configurations with the External Keys API. On Claude Platform on AWS
          #   the value is the AWS KMS key ARN, and the key must be a single-Region key in the
          #   same AWS account and Region as the Workspace. On that platform the key is
          #   validated against this Workspace when it is attached, so a key-policy problem is
          #   reported as an error on this request. This field is write-once: once a key is
          #   attached to a Workspace it cannot be detached or replaced. To rotate key
          #   material, rotate the underlying key on your cloud KMS; the `external_key_id`
          #   stays the same.
          #
          #   @return [String, nil]
          optional :external_key_id, String, nil?: true

          # @!attribute tags
          #   User-defined tags as string key-value pairs. Keys may not begin with
          #   `anthropic`.
          #
          #   @return [Hash{Symbol=>String}, nil]
          optional :tags, Anthropic::Internal::Type::HashOf[String], nil?: true

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(name:, data_residency: nil, display_color: nil, external_key_id: nil, tags: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WorkspaceCreateParams} for more details.
          #
          #   @param name [String] Name of the Workspace.
          #
          #   @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig, nil] Data residency configuration for the workspace. If omitted, defaults to `workspa
          #
          #   @param display_color [String, nil] Hex color code representing the Workspace in the Anthropic Console.
          #
          #   @param external_key_id [String, nil] ID of the customer-managed encryption key (CMEK) configuration to use for this
          #
          #   @param tags [Hash{Symbol=>String}, nil] User-defined tags as string key-value pairs. Keys may not begin with `anthropic`
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
