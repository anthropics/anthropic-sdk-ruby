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
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
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
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
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
