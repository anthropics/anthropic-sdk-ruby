# typed: strong

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
            sig do
              params(
                id: String,
                include_inherited: T::Boolean,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
              )
            end
            def retrieve(
              # Path param: The workspace's identifier, starting with `slws_`.
              id,
              # Query param: When `true`, `settings` holds what applies in the workspace once
              # the organization's Slack defaults are taken into account, and every member of
              # `sources` names the level a value comes from. When `false` or left out,
              # `settings` holds what the workspace itself stores.
              include_inherited: nil,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Change the settings a Slack workspace stores. The update is partial: a setting
            # left out is unchanged, and a setting sent as null is cleared, so the workspace
            # inherits it. If any value is refused, no setting in the request is stored.
            sig do
              params(
                id: String,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate::OrHash,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
              )
            end
            def update(
              # Path param: The workspace's identifier, starting with `slws_`.
              id,
              # Body param: The settings to change.
              settings:,
              # Header param: This endpoint is in beta: requests must send
              # `experimental-claude-tag-2026-10-21` in this header.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                include_inherited: T::Boolean,
                limit: Integer,
                page: String,
                slack_workspace_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace
                ]
              )
            end
            def list(
              # Query param: When `true`, `settings` holds what applies in each workspace once
              # the organization's Slack defaults are taken into account, and every member of
              # `sources` names the level a value comes from. When `false` or left out,
              # `settings` holds what each workspace itself stores.
              include_inherited: nil,
              # Query param: Number of items to return per page, between 1 and 100. Defaults
              # to 20.
              limit: nil,
              # Query param: Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Query param: Slack's identifier for one workspace, as in the workspace object's
              # `slack.workspace_id`, not its `id`. With it `data` holds that workspace alone,
              # or nothing when it is not set up.
              slack_workspace_id: nil,
              # Header param: This endpoint is in beta: requests must send
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
