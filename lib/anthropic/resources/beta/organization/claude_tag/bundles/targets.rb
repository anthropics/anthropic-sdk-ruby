# frozen_string_literal: true

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
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetCreateParams}
              # for more details.
              #
              # @overload create(bundle_id, target:, betas: nil, request_options: {})
              #
              # @param bundle_id [String] Path param: The Bundle's identifier, starting with `capp_`.
              #
              # @param target [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate] Body param
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetCreateParams
              def create(bundle_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::TargetCreateParams.dump_request(params)
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_TARGETS_CREATE,
                  span_attributes: {"anthropic.organization.claude_tag.bundle.id" => bundle_id},
                  span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}/targets",
                  method: :post,
                  path: ["v1/organizations/claude_tag/bundles/%1$s/targets", bundle_id],
                  headers: parsed.except(:target).transform_keys(betas: "anthropic-beta"),
                  body: parsed[:target],
                  model: Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget,
                  options: {
                    extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                    **options
                  }
                )
              end

              # Get one Bundle Target. Returns 404 when `target_id` is the identifier of another
              # Bundle's Bundle Target, or the Bundle Target was detached.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetRetrieveParams}
              # for more details.
              #
              # @overload retrieve(target_id, bundle_id:, betas: nil, request_options: {})
              #
              # @param target_id [String] Path param: The Bundle Target's identifier, starting with `btgt_`. Attach Bundle
              #
              # @param bundle_id [String] Path param: The Bundle's identifier, starting with `capp_`.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetRetrieveParams
              def retrieve(target_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::TargetRetrieveParams.dump_request(params)
                bundle_id =
                  parsed.delete(:bundle_id) do
                    raise ArgumentError.new("missing required path argument #{_1}")
                  end
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_TARGETS_RETRIEVE,
                  span_attributes: {
                    "anthropic.organization.claude_tag.bundle.id" => bundle_id,
                    "anthropic.organization.claude_tag.bundle.target.id" => target_id
                  },
                  span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}/targets/{target_id}",
                  method: :get,
                  path: ["v1/organizations/claude_tag/bundles/%1$s/targets/%2$s", bundle_id, target_id],
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget,
                  options: {
                    extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                    **options
                  }
                )
              end

              # List the Slack channels and Slack workspaces a Bundle is attached to, newest
              # first by `created_at`. Only channels and workspaces the organization owns are
              # listed; a Bundle that is attached to anything else has no Bundle Target for it.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetListParams}
              # for more details.
              #
              # @overload list(bundle_id, limit: nil, page: nil, betas: nil, request_options: {})
              #
              # @param bundle_id [String] Path param: The Bundle's identifier, starting with `capp_`.
              #
              # @param limit [Integer] Query param: Number of items to return per page, between 1 and 100. Defaults to
              #
              # @param page [String] Query param: Opaque cursor from a previous response's `next_page`.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget>]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetListParams
              def list(bundle_id, params = {})
                query_params = [:limit, :page]
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::TargetListParams.dump_request(params)
                query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_TARGETS_LIST,
                  span_attributes: {"anthropic.organization.claude_tag.bundle.id" => bundle_id},
                  span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}/targets",
                  span_query: %w[limit page],
                  method: :get,
                  path: ["v1/organizations/claude_tag/bundles/%1$s/targets", bundle_id],
                  query: query,
                  headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                  page: Anthropic::Internal::PageCursor,
                  model: Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget,
                  options: {
                    extra_headers: {"anthropic-beta" => "experimental-claude-tag-2026-10-21"},
                    **options
                  }
                )
              end

              # Detach a Bundle from a Slack channel or a Slack workspace. A repeated detach
              # returns 404.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetDeleteParams}
              # for more details.
              #
              # @overload delete(target_id, bundle_id:, betas: nil, request_options: {})
              #
              # @param target_id [String] Path param: The Bundle Target's identifier, starting with `btgt_`. Attach Bundle
              #
              # @param bundle_id [String] Path param: The Bundle's identifier, starting with `capp_`.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `experimental-claude-
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagDeletedBundleTarget]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetDeleteParams
              def delete(target_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::TargetDeleteParams.dump_request(params)
                bundle_id =
                  parsed.delete(:bundle_id) do
                    raise ArgumentError.new("missing required path argument #{_1}")
                  end
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_TAG_BUNDLES_TARGETS_DELETE,
                  span_attributes: {
                    "anthropic.organization.claude_tag.bundle.id" => bundle_id,
                    "anthropic.organization.claude_tag.bundle.target.id" => target_id
                  },
                  span_route: "/v1/organizations/claude_tag/bundles/{bundle_id}/targets/{target_id}",
                  method: :delete,
                  path: ["v1/organizations/claude_tag/bundles/%1$s/targets/%2$s", bundle_id, target_id],
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagDeletedBundleTarget,
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
end
