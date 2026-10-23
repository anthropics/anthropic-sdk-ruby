# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          class SlackChannels
            # Set a Slack channel up for Claude Tag and return it with its identifier. If the
            # channel is already set up, whether in claude.ai, by Claude's first use in it or
            # by an earlier request, the existing channel is returned, so the request can be
            # repeated. `settings`, when sent, is applied as an update applies it. Before a
            # channel is set up, Claude's Slack app confirms with Slack that the channel is in
            # the workspace, is not archived and is visible to the app; a channel that fails
            # the confirmation returns 404. Setting the channel up and applying `settings` are
            # two steps: when the second is refused, the response is the refusal, the channel
            # stays set up with every setting unset, and the error's
            # `details.slack_channel_id` holds the channel's identifier.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelCreateParams} for
            # more details.
            #
            # @overload create(slack:, settings: nil, betas: nil, request_options: {})
            #
            # @param slack [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers] Body param: Slack's own identifiers for the channel to set up. The organization
            #
            # @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsCreate] Body param: Settings to store on the channel, applied as Update Slack Channel ap
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelCreateParams
            def create(params)
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::SlackChannelCreateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_CHANNELS_CREATE,
                span_created_id: "anthropic.organization.claude_tag.slack_channel.id",
                span_route: "/v1/organizations/claude_tag/slack_channels",
                method: :post,
                path: "v1/organizations/claude_tag/slack_channels",
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # Get one Slack channel and its settings. By default `settings` holds what the
            # channel itself stores: a setting that is null there is not set on the channel
            # and is inherited. With `include_inherited=true`, `settings` holds what applies
            # in the channel once the settings levels above it are taken into account, and the
            # request fails with 503 rather than resolve against a settings level that could
            # not be read. Either way `sources` names the settings level each value comes
            # from, so a caller tells the channel's own value from an inherited one by its
            # source, not by whether it is null.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelRetrieveParams}
            # for more details.
            #
            # @overload retrieve(id, include_inherited: nil, betas: nil, request_options: {})
            #
            # @param id [String] Path param: The channel's identifier, starting with `slch_`.
            #
            # @param include_inherited [Boolean] Query param: When `true`, `settings` holds what applies in the channel once the
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelRetrieveParams
            def retrieve(id, params = {})
              query_params = [:include_inherited]
              parsed, options =
                Anthropic::Beta::Organization::ClaudeTag::SlackChannelRetrieveParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_CHANNELS_RETRIEVE,
                span_attributes: {"anthropic.organization.claude_tag.slack_channel.id" => id},
                span_route: "/v1/organizations/claude_tag/slack_channels/{id}",
                span_query: %w[include_inherited],
                method: :get,
                path: ["v1/organizations/claude_tag/slack_channels/%1$s", id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # Change the settings a Slack channel stores. The update is partial: a setting
            # left out is unchanged, and a setting sent as null is cleared, so the channel
            # inherits it. If any value is refused, no setting in the request is stored. A
            # group direct message takes no settings and returns 400.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelUpdateParams} for
            # more details.
            #
            # @overload update(id, settings:, betas: nil, request_options: {})
            #
            # @param id [String] Path param: The channel's identifier, starting with `slch_`.
            #
            # @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingsUpdate] Body param: The settings to change.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelUpdateParams
            def update(id, params)
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::SlackChannelUpdateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_CHANNELS_UPDATE,
                span_attributes: {"anthropic.organization.claude_tag.slack_channel.id" => id},
                span_route: "/v1/organizations/claude_tag/slack_channels/{id}",
                method: :post,
                path: ["v1/organizations/claude_tag/slack_channels/%1$s", id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # List the set-up Slack channels of one Slack workspace, newest first by
            # `created_at`. A channel that is not set up is not listed: Slack holds the full
            # list of a workspace's channels. Pass `slack_channel_id` as well to look one
            # channel up by its Slack identifiers: `data` then holds that channel, or is empty
            # when it is not set up, and `limit` and `page` are ignored. A workspace that the
            # organization owns only through a Slack Enterprise Grid returns 404 until it is
            # set up. With `include_inherited=true` each channel's `settings` holds what
            # applies in it, and the request fails with 503 rather than resolve against a
            # settings level that could not be read. A `page` cursor resumes only a request
            # with the same `include_inherited`.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelListParams} for
            # more details.
            #
            # @overload list(slack_workspace_id:, include_inherited: nil, limit: nil, page: nil, slack_channel_id: nil, betas: nil, request_options: {})
            #
            # @param slack_workspace_id [String] Query param: The Slack workspace whose channels to list: Slack's identifier for
            #
            # @param include_inherited [Boolean] Query param: When `true`, `settings` holds what applies in each channel once the
            #
            # @param limit [Integer] Query param: Number of items to return per page, between 1 and 100. Defaults to
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`.
            #
            # @param slack_channel_id [String] Query param: Slack's identifier for one channel of that workspace, as in the cha
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel>]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelListParams
            def list(params)
              query_params = [:slack_workspace_id, :include_inherited, :limit, :page, :slack_channel_id]
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::SlackChannelListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_CHANNELS_LIST,
                span_route: "/v1/organizations/claude_tag/slack_channels",
                span_query: %w[include_inherited limit page slack_channel_id slack_workspace_id],
                method: :get,
                path: "v1/organizations/claude_tag/slack_channels",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel,
                options: {
                  extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                  **options
                }
              )
            end

            # Remove a Slack channel from Claude Tag. This deletes the channel's stored
            # settings and its Bundle Targets at once, and then, in the background, the
            # channel's sessions and their transcripts, its memory, its routines and the
            # artifacts published from it. None of it can be restored. The channel in Slack
            # and its messages are unchanged. The request is refused with 400 and
            # `error.details.error_code` `slack_channel_enabled` while `enabled` resolves to
            # `true` for the channel, as a read with `include_inherited=true` returns it: set
            # `enabled` to `false` on the channel first. This guards against removing a
            # channel in use by mistake; it is not a way to keep Claude out, because the
            # removal deletes the channel's own `enabled: false` with its other settings,
            # after which the channel inherits again and Claude's next use of it can set it up
            # anew with a new identifier. The identifier returns 404 as soon as the request
            # returns, so a repeated removal returns 404. A group direct message returns 400,
            # and so does a channel that holds configuration this API does not manage.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelDeleteParams} for
            # more details.
            #
            # @overload delete(id, betas: nil, request_options: {})
            #
            # @param id [String] The channel's identifier, starting with `slch_`.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagDeletedSlackChannel]
            #
            # @see Anthropic::Models::Beta::Organization::ClaudeTag::SlackChannelDeleteParams
            def delete(id, params = {})
              parsed, options = Anthropic::Beta::Organization::ClaudeTag::SlackChannelDeleteParams.dump_request(params)
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_SLACK_CHANNELS_DELETE,
                span_attributes: {"anthropic.organization.claude_tag.slack_channel.id" => id},
                span_route: "/v1/organizations/claude_tag/slack_channels/{id}",
                method: :delete,
                path: ["v1/organizations/claude_tag/slack_channels/%1$s", id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagDeletedSlackChannel,
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
