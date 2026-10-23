# typed: strong

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
            sig do
              params(
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsCreate::OrHash,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
              )
            end
            def create(
              # Body param: Slack's own identifiers for the channel to set up. The organization
              # must own the workspace.
              slack:,
              # Body param: Settings to store on the channel, applied as Update Slack Channel
              # applies them.
              settings: nil,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                id: String,
                include_inherited: T::Boolean,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
              )
            end
            def retrieve(
              # Path param: The channel's identifier, starting with `slch_`.
              id,
              # Query param: When `true`, `settings` holds what applies in the channel once the
              # settings levels above it are taken into account, and every member of `sources`
              # names the level a value comes from. When `false` or left out, `settings` holds
              # what the channel itself stores.
              include_inherited: nil,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Change the settings a Slack channel stores. The update is partial: a setting
            # left out is unchanged, and a setting sent as null is cleared, so the channel
            # inherits it. If any value is refused, no setting in the request is stored. A
            # group direct message takes no settings and returns 400.
            sig do
              params(
                id: String,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate::OrHash,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
              )
            end
            def update(
              # Path param: The channel's identifier, starting with `slch_`.
              id,
              # Body param: The settings to change.
              settings:,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                slack_workspace_id: String,
                include_inherited: T::Boolean,
                limit: Integer,
                page: String,
                slack_channel_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel
                ]
              )
            end
            def list(
              # Query param: The Slack workspace whose channels to list: Slack's identifier for
              # it, as in the channel object's `slack.workspace_id`, not the workspace object's
              # `id`.
              slack_workspace_id:,
              # Query param: When `true`, `settings` holds what applies in each channel once the
              # settings levels above it are taken into account, and every member of `sources`
              # names the level a value comes from. When `false` or left out, `settings` holds
              # what each channel itself stores.
              include_inherited: nil,
              # Query param: Number of items to return per page, between 1 and 100. Defaults
              # to 20.
              limit: nil,
              # Query param: Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Query param: Slack's identifier for one channel of that workspace, as in the
              # channel object's `slack.channel_id`. It is not the channel object's `id`. With
              # it `data` holds that channel alone, or nothing when the channel is not set up.
              slack_channel_id: nil,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagDeletedSlackChannel
              )
            end
            def delete(
              # The channel's identifier, starting with `slch_`.
              id,
              # This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
