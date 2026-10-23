# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          class SlackWorkspaces
            # Get one Slack workspace and its settings. By default `settings` holds what the
            # workspace itself stores: a setting that is null there is not set on the
            # workspace and is inherited. With `include_inherited=true`, `settings` holds what
            # applies in the workspace once the organization's Slack defaults are taken into
            # account, and the request fails with 503 rather than resolve against a settings
            # level that could not be read. Either way `sources` names the settings level each
            # value comes from.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceRetrieveParams}
            # for more details.
            #
            # @overload retrieve(id, include_inherited: nil, betas: nil, request_options: {})
            #
            # @param id [String] Path param: The workspace's identifier, starting with `slws_`.
            #
            # @param include_inherited [Boolean] Query param: When `true`, `settings` holds what applies in the workspace once th
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceRetrieveParams
            def retrieve(id, params = {})
              query_params = [:include_inherited]
              parsed, options =
                Anthropic::Beta::Organization::ClaudeTag::SlackWorkspaceRetrieveParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_WORKSPACES_RETRIEVE,
                span_attributes: {"anthropic.organization.claude_tag.slack_workspace.id" => id},
                span_route: "/v1/organizations/claude_tag/slack_workspaces/{id}",
                span_query: %w[include_inherited],
                method: :get,
                path: ["v1/organizations/claude_tag/slack_workspaces/%1$s", id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # Change the settings a Slack workspace stores. The update is partial: a setting
            # left out is unchanged, and a setting sent as null is cleared, so the workspace
            # inherits it. If any value is refused, no setting in the request is stored.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceUpdateParams}
            # for more details.
            #
            # @overload update(id, settings:, betas: nil, request_options: {})
            #
            # @param id [String] Path param: The workspace's identifier, starting with `slws_`.
            #
            # @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsUpdate] Body param: The settings to change.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceUpdateParams
            def update(id, params)
              parsed, options =
                Anthropic::Beta::Organization::ClaudeTag::SlackWorkspaceUpdateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_WORKSPACES_UPDATE,
                span_attributes: {"anthropic.organization.claude_tag.slack_workspace.id" => id},
                span_route: "/v1/organizations/claude_tag/slack_workspaces/{id}",
                method: :post,
                path: ["v1/organizations/claude_tag/slack_workspaces/%1$s", id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # List the set-up Slack workspaces the organization owns, newest first by
            # `created_at`. Pass `slack_workspace_id` to look one workspace up by its Slack
            # identifier: `data` then holds that workspace, or is empty when it is not set up.
            # A workspace of a Slack Enterprise Grid the organization has connected returns
            # 404 until it is set up. With `include_inherited=true` each workspace's
            # `settings` holds what applies in it, and the request fails with 503 rather than
            # resolve against a settings level that could not be read. A `page` cursor resumes
            # only a request with the same `include_inherited`.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceListParams} for
            # more details.
            #
            # @overload list(include_inherited: nil, limit: nil, page: nil, slack_workspace_id: nil, betas: nil, request_options: {})
            #
            # @param include_inherited [Boolean] Query param: When `true`, `settings` holds what applies in each workspace once t
            #
            # @param limit [Integer] Query param: Number of items to return per page, between 1 and 100. Defaults to
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param slack_workspace_id [String] Query param: Slack's identifier for one workspace, as in the workspace object's
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace>]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackWorkspaceListParams
            def list(params = {})
              query_params = [:include_inherited, :limit, :page, :slack_workspace_id]
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::SlackWorkspaceListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_WORKSPACES_LIST,
                span_route: "/v1/organizations/claude_tag/slack_workspaces",
                span_query: %w[include_inherited limit page slack_workspace_id],
                method: :get,
                path: "v1/organizations/claude_tag/slack_workspaces",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace,
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
            end
          end
        end
      end
    end
  end
end
