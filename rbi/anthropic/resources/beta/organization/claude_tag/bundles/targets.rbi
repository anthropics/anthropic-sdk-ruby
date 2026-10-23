# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          class Bundles
            class Targets
              # Attach a Bundle to a Slack channel or a Slack workspace. A Bundle attached to a
              # workspace can be used in the workspace and in every channel in it. Attaching a
              # Bundle to a channel or workspace it is already attached to returns the existing
              # Bundle Target. The channel or workspace must be set up: attaching never sets a
              # channel up. A group direct message takes no Bundle and returns 400.
              sig do
                params(
                  bundle_id: String,
                  target:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate::OrHash,
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate::OrHash
                    ),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Variants
                )
              end
              def create(
                # Path param: The Bundle's identifier, starting with `capp_`.
                bundle_id,
                # Body param
                target:,
                # Header param: This endpoint is in beta: requests must send
                # `experimental-claude-tag-2026-10-21` in this header.
                betas: nil,
                request_options: {}
              )
              end

              # Get one Bundle Target. Returns 404 when `target_id` is the identifier of another
              # Bundle's Bundle Target, or the Bundle Target was detached.
              sig do
                params(
                  target_id: String,
                  bundle_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Variants
                )
              end
              def retrieve(
                # Path param: The Bundle Target's identifier, starting with `btgt_`. Attach Bundle
                # and List Bundle Targets return it. It is never the identifier of the channel or
                # workspace.
                target_id,
                # Path param: The Bundle's identifier, starting with `capp_`.
                bundle_id:,
                # Header param: This endpoint is in beta: requests must send
                # `experimental-claude-tag-2026-10-21` in this header.
                betas: nil,
                request_options: {}
              )
              end

              # List the Slack channels and Slack workspaces a Bundle is attached to, newest
              # first by `created_at`. Only channels and workspaces the organization owns are
              # listed; a Bundle that is attached to anything else has no Bundle Target for it.
              sig do
                params(
                  bundle_id: String,
                  limit: Integer,
                  page: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Internal::PageCursor[
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Variants
                  ]
                )
              end
              def list(
                # Path param: The Bundle's identifier, starting with `capp_`.
                bundle_id,
                # Query param: Number of items to return per page, between 1 and 100. Defaults
                # to 20.
                limit: nil,
                # Query param: Opaque cursor from a previous response's `next_page`.
                page: nil,
                # Header param: This endpoint is in beta: requests must send
                # `experimental-claude-tag-2026-10-21` in this header.
                betas: nil,
                request_options: {}
              )
              end

              # Detach a Bundle from a Slack channel or a Slack workspace. A repeated detach
              # returns 404.
              sig do
                params(
                  target_id: String,
                  bundle_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagDeletedBundleTarget
                )
              end
              def delete(
                # Path param: The Bundle Target's identifier, starting with `btgt_`. Attach Bundle
                # and List Bundle Targets return it. It is never the identifier of the channel or
                # workspace.
                target_id,
                # Path param: The Bundle's identifier, starting with `capp_`.
                bundle_id:,
                # Header param: This endpoint is in beta: requests must send
                # `experimental-claude-tag-2026-10-21` in this header.
                betas: nil,
                request_options: {}
              )
              end

              # @api private
              sig do
                params(client: Anthropic::Client).returns(T.attached_class)
              end
              def self.new(client:)
              end
            end
          end
        end
      end
    end
  end
end
