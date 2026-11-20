# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          # @return [Anthropic::Resources::Beta::Organization::Workspaces::RateLimits]
          attr_reader :rate_limits

          # @return [Anthropic::Resources::Beta::Organization::Workspaces::Members]
          attr_reader :members

          # @return [Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts]
          attr_reader :service_accounts

          # Create Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceCreateParams} for more details.
          #
          # @overload create(name:, data_residency: nil, display_color: nil, external_key_id: nil, inference_data_privacy: nil, tags: nil, user_profile_id: nil, betas: nil, request_options: {})
          #
          # @param name [String] Body param: Name of the Workspace.
          #
          # @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig, nil] Body param: Data residency configuration for the workspace. If omitted, defaults
          #
          # @param display_color [String, nil] Body param: Hex color code representing the Workspace in the Anthropic Console.
          #
          # @param external_key_id [String, nil] Body param: ID of the customer-managed encryption key (CMEK) configuration to us
          #
          # @param inference_data_privacy [Anthropic::Models::Beta::Organization::BetaInferenceDataPrivacyCreateParam, nil] Body param: Where the Workspace's retained inference data and transcript copies
          #
          # @param tags [Hash{Symbol=>String}, nil] Body param: User-defined tags as string key-value pairs. Keys may not begin with
          #
          # @param user_profile_id [String, nil] Body param: ID of a user profile to attach to the Workspace. Every inference req
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::BetaApprovalRequiredError]
          # @raise [Anthropic::Models::Organization::ExternalKeyValidationFailedError]
          # @raise [Anthropic::Models::Organization::ExternalKeyValidationTimedOutError]
          # @raise [Anthropic::Models::Beta::Organization::BetaExternalStorageNotAvailableError]
          # @raise [Anthropic::Models::Beta::Organization::BetaGrantRequiredError]
          # @raise [Anthropic::Models::Beta::BetaHumanReviewNotAvailableError]
          # @raise [Anthropic::Models::Beta::Organization::BetaHumanReviewOnWithExternalStorageError]
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          # @raise [Anthropic::Models::Organization::KeyProfileMismatchError]
          # @raise [Anthropic::Models::Beta::BetaOrganizationNotEligibleError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageNotAttachableError]
          # @raise [Anthropic::Models::Organization::StorageProfileMismatchError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageVerificationFailedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaTranscriptsStorageRequiredError]
          # @raise [Anthropic::Models::UserProfileNotFoundError]
          # @raise [Anthropic::Models::Organization::WorkspacePolicyViolationError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          # @raise [Anthropic::Models::Organization::ExternalKeyChangedError]
          # @raise [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableError]
          # @raise [Anthropic::Models::Organization::WorkspaceCreatedIncompleteError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::WorkspaceCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_CREATE,
              span_created_id: "anthropic.organization.workspace.id",
              span_route: "/v1/organizations/workspaces",
              method: :post,
              path: "v1/organizations/workspaces",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # Get Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceRetrieveParams} for more
          # details.
          #
          # @overload retrieve(workspace_id, betas: nil, request_options: {})
          #
          # @param workspace_id [String] ID of the Workspace.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceRetrieveParams
          def retrieve(workspace_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WorkspaceRetrieveParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_RETRIEVE,
              span_attributes: {"anthropic.organization.workspace.id" => workspace_id},
              span_route: "/v1/organizations/workspaces/{workspace_id}",
              method: :get,
              path: ["v1/organizations/workspaces/%1$s", workspace_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # Update Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceUpdateParams} for more details.
          #
          # @overload update(workspace_id, data_residency: nil, display_color: nil, external_key_id: nil, inference_data_privacy: nil, name: nil, tags: nil, user_profile_id: nil, betas: nil, request_options: {})
          #
          # @param workspace_id [String] Path param
          #
          # @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig, nil] Body param: Data residency configuration for the workspace.
          #
          # @param display_color [String] Body param: Hex color code representing the Workspace in the Anthropic Console.
          #
          # @param external_key_id [String] Body param: ID of the customer-managed encryption key (CMEK) configuration to us
          #
          # @param inference_data_privacy [Anthropic::Models::Beta::Organization::BetaInferenceDataPrivacyUpdateParam, nil] Body param: Changes to where the Workspace's retained inference data and transcr
          #
          # @param name [String] Body param: Name of the Workspace.
          #
          # @param tags [Hash{Symbol=>String, nil}, nil] Body param: User-defined tags as string key-value pairs. Keys may not begin with
          #
          # @param user_profile_id [String] Body param: ID of a user profile to attach to the Workspace. Every inference req
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional. Send `efs-2026-10-01` in this header to use this endpoin
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::BetaApprovalRequiredError]
          # @raise [Anthropic::Models::Organization::ExternalKeyValidationFailedError]
          # @raise [Anthropic::Models::Organization::ExternalKeyValidationTimedOutError]
          # @raise [Anthropic::Models::Beta::Organization::BetaExternalStorageNotAvailableError]
          # @raise [Anthropic::Models::Beta::Organization::BetaGrantRequiredError]
          # @raise [Anthropic::Models::Beta::BetaHumanReviewNotAvailableError]
          # @raise [Anthropic::Models::Beta::Organization::BetaHumanReviewOnWithExternalStorageError]
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          # @raise [Anthropic::Models::Organization::KeyProfileMismatchError]
          # @raise [Anthropic::Models::Beta::BetaOrganizationNotEligibleError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageAttachLimitReachedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageNotAttachableError]
          # @raise [Anthropic::Models::Organization::StorageProfileMismatchError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageProfileStillRequiredError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageVerificationFailedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaTranscriptsStorageRequiredError]
          # @raise [Anthropic::Models::UserProfileNotFoundError]
          # @raise [Anthropic::Models::Organization::WorkspacePolicyViolationError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          # @raise [Anthropic::Models::Organization::ExternalKeyChangedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageChangedConcurrentlyError]
          # @raise [Anthropic::Models::Beta::Organization::BetaWorkspaceChangedConcurrentlyError]
          # @raise [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableError]
          # @raise [Anthropic::Models::ChangeOutcomeUnknownError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceUpdateParams
          def update(workspace_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WorkspaceUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_UPDATE,
              span_attributes: {"anthropic.organization.workspace.id" => workspace_id},
              span_route: "/v1/organizations/workspaces/{workspace_id}",
              method: :post,
              path: ["v1/organizations/workspaces/%1$s", workspace_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # List Workspaces
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceListParams} for more details.
          #
          # @overload list(after_id: nil, before_id: nil, ids: nil, include_archived: nil, include_default: nil, limit: nil, betas: nil, request_options: {})
          #
          # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
          #
          # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
          #
          # @param ids [Array<String>] Query param: Only the Workspaces with these IDs, at most 100. `include_archived`
          #
          # @param include_archived [Boolean] Query param: Whether to include Workspaces that have been archived in the respon
          #
          # @param include_default [Boolean] Query param: Whether to include the organization's default Workspace in the resp
          #
          # @param limit [Integer] Query param: Number of items to return per page.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional. Send `efs-2026-10-01` in this header to use this endpoin
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Organization::BetaWorkspace>]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceListParams
          def list(params = {})
            query_params = [:after_id, :before_id, :ids, :include_archived, :include_default, :limit]
            parsed, options = Anthropic::Beta::Organization::WorkspaceListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_LIST,
              span_route: "/v1/organizations/workspaces",
              span_query: %w[after_id before_id ids include_archived include_default limit],
              method: :get,
              path: "v1/organizations/workspaces",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::Page,
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # Archive Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceArchiveParams} for more
          # details.
          #
          # @overload archive(workspace_id, betas: nil, request_options: {})
          #
          # @param workspace_id [String]
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          # @raise [Anthropic::Models::Organization::StorageAttachedDuringArchiveError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceArchiveParams
          def archive(workspace_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WorkspaceArchiveParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_ARCHIVE,
              span_attributes: {"anthropic.organization.workspace.id" => workspace_id},
              span_route: "/v1/organizations/workspaces/{workspace_id}/archive",
              method: :post,
              path: ["v1/organizations/workspaces/%1$s/archive", workspace_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @rate_limits = Anthropic::Resources::Beta::Organization::Workspaces::RateLimits.new(client: client)
            @members = Anthropic::Resources::Beta::Organization::Workspaces::Members.new(client: client)
            @service_accounts =
              Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts.new(client: client)
          end
        end
      end
    end
  end
end
