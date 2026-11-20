# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ExternalStorage
          # Register a bucket in the organization's own cloud account. It is saved as
          # `pending_configuration` and verified when activated.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageCreateParams} for more
          # details.
          #
          # @overload create(provider_config:, display_name: nil, user_profile_id: nil, betas: nil, request_options: {})
          #
          # @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalStorageConfigParam, Anthropic::Models::Beta::Organization::BetaGCPExternalStorageConfigParam] Body param
          #
          # @param display_name [String, nil] Body param: Human-friendly display name.
          #
          # @param user_profile_id [String, nil] Body param: The user profile to bind the storage to. It can't be changed later.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in t
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaGrantRequiredError]
          # @raise [Anthropic::Models::Beta::BetaOrganizationNotEligibleError]
          # @raise [Anthropic::Models::Beta::Organization::BetaProviderNotAllowedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaUnsupportedRegionError]
          # @raise [Anthropic::Models::UserProfileNotFoundError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageAlreadyRegisteredError]
          # @raise [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorage]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::ExternalStorageCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_CREATE,
              span_created_id: "anthropic.organization.external_storage.id",
              span_route: "/v1/organizations/external_storage",
              method: :post,
              path: "v1/organizations/external_storage",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # Get one External Storage in the organization.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageRetrieveParams} for more
          # details.
          #
          # @overload retrieve(external_storage_id, betas: nil, request_options: {})
          #
          # @param external_storage_id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorage]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageRetrieveParams
          def retrieve(external_storage_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ExternalStorageRetrieveParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_RETRIEVE,
              span_attributes: {"anthropic.organization.external_storage.id" => external_storage_id},
              span_route: "/v1/organizations/external_storage/{external_storage_id}",
              method: :get,
              path: ["v1/organizations/external_storage/%1$s", external_storage_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # Rename External Storage or clear its name, in any status.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageUpdateParams} for more
          # details.
          #
          # @overload update(external_storage_id, display_name:, betas: nil, request_options: {})
          #
          # @param external_storage_id [String] Path param: The External Storage ID, which starts with `estrg_`. Through Claude
          #
          # @param display_name [String, nil] Body param: Human-friendly display name; null clears it.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in t
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorage]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageUpdateParams
          def update(external_storage_id, params)
            parsed, options = Anthropic::Beta::Organization::ExternalStorageUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_UPDATE,
              span_attributes: {"anthropic.organization.external_storage.id" => external_storage_id},
              span_route: "/v1/organizations/external_storage/{external_storage_id}",
              method: :post,
              path: ["v1/organizations/external_storage/%1$s", external_storage_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # List the organization's External Storage, newest first.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageListParams} for more
          # details.
          #
          # @overload list(limit: nil, page: nil, user_profile_ids: nil, betas: nil, request_options: {})
          #
          # @param limit [Integer] Query param: Number of results per page.
          #
          # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page`.
          #
          # @param user_profile_ids [Array<String>, nil] Query param: Returns only External Storage bound to one of these user profile ID
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in t
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaExternalStorage>]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageListParams
          def list(params = {})
            query_params = [:limit, :page, :user_profile_ids]
            parsed, options = Anthropic::Beta::Organization::ExternalStorageListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_LIST,
              span_route: "/v1/organizations/external_storage",
              span_query: %w[limit page user_profile_ids],
              method: :get,
              path: "v1/organizations/external_storage",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # Delete External Storage. Storage that is pending configuration, available, or
          # active but never attached is deleted at once, unless an Enterprise Frontier
          # Safeguards workspace policy lists it. Other storage gets a 400 that says what to
          # do next. On `draining` storage that 400 can mean this delete started a removal
          # that can't be undone. To check, get the storage: if `status.removal_started` is
          # true, delete it again later to finish.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageDeleteParams} for more
          # details.
          #
          # @overload delete(external_storage_id, betas: nil, request_options: {})
          #
          # @param external_storage_id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaExternalStorageInUseError]
          # @raise [Anthropic::Models::Beta::Organization::BetaExternalStorageInWorkspacePolicyError]
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaDeletedExternalStorage]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageDeleteParams
          def delete(external_storage_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ExternalStorageDeleteParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_DELETE,
              span_attributes: {"anthropic.organization.external_storage.id" => external_storage_id},
              span_route: "/v1/organizations/external_storage/{external_storage_id}",
              method: :delete,
              path: ["v1/organizations/external_storage/%1$s", external_storage_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaDeletedExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # Verify pending External Storage and make it available. Storage that is already
          # available, active or draining comes back unchanged, without any check.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ExternalStorageActivateParams} for more
          # details.
          #
          # @overload activate(external_storage_id, betas: nil, request_options: {})
          #
          # @param external_storage_id [String] The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaGrantRequiredError]
          # @raise [Anthropic::Models::Beta::Organization::BetaInvalidStorageARNError]
          # @raise [Anthropic::Models::Beta::BetaOrganizationNotEligibleError]
          # @raise [Anthropic::Models::Beta::Organization::BetaProviderNotAllowedError]
          # @raise [Anthropic::Models::Beta::Organization::BetaStorageVerificationFailedError]
          # @raise [Anthropic::Models::UserProfileNotFoundError]
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          # @raise [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorage]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalStorageActivateParams
          def activate(external_storage_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ExternalStorageActivateParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_EXTERNAL_STORAGE_ACTIVATE,
              span_attributes: {"anthropic.organization.external_storage.id" => external_storage_id},
              span_route: "/v1/organizations/external_storage/{external_storage_id}/activate",
              method: :post,
              path: ["v1/organizations/external_storage/%1$s/activate", external_storage_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaExternalStorage,
              options: {extra_headers: {"anthropic-beta" => "efs-2026-10-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
