# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          class Bundles
            # @return [Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets]
            attr_reader :targets

            # Get one Bundle. What the Bundle grants (connectors, repositories and
            # credentials) is never returned.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::BundleRetrieveParams} for
            # more details.
            #
            # @overload retrieve(bundle_id, betas: nil, request_options: {})
            #
            # @param bundle_id [String] The Bundle's identifier, starting with `capp_`.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @raise [Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingError]
            # @raise [Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledError]
            # @raise [Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedError]
            # @raise [Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredError]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagBundle]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::BundleRetrieveParams
            def retrieve(bundle_id, params = {})
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::BundleRetrieveParams.dump_request(params)
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_RETRIEVE,
                span_attributes: {"anthropic.organization.claude_tag.bundle.id" => bundle_id},
                span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}",
                method: :get,
                path: ["v1/organizations/claude_tag/bundles/%1$s", bundle_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # Change a Bundle's instructions. The update is partial: a field left out is
            # unchanged, and `instructions` sent as null or as an empty string clears them.
            # The later of two updates wins. Sessions that start after the change use the new
            # instructions; sessions already running keep the ones they started with. Some
            # Bundles are managed in claude.ai, and an update of one returns 400.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::BundleUpdateParams} for more
            # details.
            #
            # @overload update(bundle_id, instructions: nil, betas: nil, request_options: {})
            #
            # @param bundle_id [String] Path param: The Bundle's identifier, starting with `capp_`.
            #
            # @param instructions [String, nil] Body param: Instructions for Claude, up to 10,000 bytes (UTF-8), added to the in
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @raise [Anthropic::Models::Beta::Organization::BetaBundleAttachmentNotSupportedError]
            # @raise [Anthropic::Models::Beta::Organization::BetaBundleOnCallError]
            # @raise [Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingError]
            # @raise [Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledError]
            # @raise [Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedError]
            # @raise [Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredError]
            # @raise [Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsConflictError]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagBundle]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::BundleUpdateParams
            def update(bundle_id, params = {})
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::BundleUpdateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_UPDATE,
                span_attributes: {"anthropic.organization.claude_tag.bundle.id" => bundle_id},
                span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}",
                method: :post,
                path: ["v1/organizations/claude_tag/bundles/%1$s", bundle_id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # List the organization's Bundles, newest first by `created_at`. A Bundle that
            # Claude Tag manages for itself is not listed.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::BundleListParams} for more
            # details.
            #
            # @overload list(limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param limit [Integer] Query param: Number of items to return per page, between 1 and 100. Defaults to
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @raise [Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingError]
            # @raise [Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledError]
            # @raise [Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedError]
            # @raise [Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredError]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagBundle>]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::BundleListParams
            def list(params = {})
              query_params = [:limit, :page]
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::BundleListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_LIST,
                span_route: "/v1/organizations/claude_tag/bundles",
                span_query: %w[limit page],
                method: :get,
                path: "v1/organizations/claude_tag/bundles",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagBundle,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
              @targets = Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets.new(client: client)
            end
          end
        end
      end
    end
  end
end
