# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class SpendLimits
          # @return [Anthropic::Resources::Beta::Organization::SpendLimits::Effective]
          attr_reader :effective

          # @return [Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests]
          attr_reader :increase_requests

          # Retrieve a spend limit by ID.
          #
          # @overload retrieve(spend_limit_id, request_options: {})
          #
          # @param spend_limit_id [String] ID of the Spend Limit.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaSpendLimit]
          #
          # @see Anthropic::Models::Beta::Organization::SpendLimitRetrieveParams
          def retrieve(spend_limit_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/spend_limits/%1$s?beta=true", spend_limit_id],
              model: Anthropic::Beta::Organization::BetaSpendLimit,
              options: params[:request_options]
            )
          end

          # List the organization's spend limits.
          #
          # A Claude Console organization's limits come in an order that is stable across
          # pages. A Claude Enterprise organization's are grouped by scope type, in the
          # order `organization`, `seat_tier`, `rbac_group`, `organization_service`, `user`;
          # within a type they come in a fixed order that is not creation order.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::SpendLimitListParams} for more details.
          #
          # @overload list(limit: nil, page: nil, scope_type: nil, betas: nil, request_options: {})
          #
          # @param limit [Integer] Query param: Maximum number of limits per page. Defaults to `20`.
          #
          # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page` field.
          #
          # @param scope_type [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimitListParams::ScopeType>, nil] Query param: Return only limits with these scope types. A Claude Console organiz
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `spend-limit-reads-20
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaSpendLimit>]
          #
          # @see Anthropic::Models::Beta::Organization::SpendLimitListParams
          def list(params = {})
            query_params = [:limit, :page, :scope_type]
            parsed, options = Anthropic::Beta::Organization::SpendLimitListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: "v1/organizations/spend_limits?beta=true",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaSpendLimit,
              options: {extra_headers: {"anthropic-beta" => "spend-limit-reads-2026-09-26"}, **options}
            )
          end

          # Delete a spend limit.
          #
          # For a Claude Enterprise organization, this deletes a per-user override, and the
          # member falls back to any inherited spend limit at that period. Its seat-tier,
          # group, and organization-level rows cannot be deleted via this endpoint. A Claude
          # Console organization deletes its organization and workspace limits. Deleting
          # them through the API is in an early access preview.
          #
          # @overload delete(spend_limit_id, request_options: {})
          #
          # @param spend_limit_id [String] ID of the Spend Limit.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::SpendLimitDeleteResponse]
          #
          # @see Anthropic::Models::Beta::Organization::SpendLimitDeleteParams
          def delete(spend_limit_id, params = {})
            @client.request(
              method: :delete,
              path: ["v1/organizations/spend_limits/%1$s?beta=true", spend_limit_id],
              model: Anthropic::Models::Beta::Organization::SpendLimitDeleteResponse,
              options: params[:request_options]
            )
          end

          # Set a spend limit.
          #
          # Upsert keyed on (scope, period): setting a limit that already exists overwrites
          # it in place. A Claude Enterprise organization sets `user` limits. Its seat-tier,
          # group, and organization-level defaults are configured in claude.ai. A Claude
          # Console organization sets `organization` and `workspace` limits, which are
          # monthly and always carry an amount. Setting those limits is in an early access
          # preview. To request access, contact your Anthropic account team.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::SpendLimitSetParams} for more details.
          #
          # @overload set(amount:, scope:, period: nil, betas: nil, request_options: {})
          #
          # @param amount [String, nil] Body param: Limit amount as a non-negative integer decimal string in the minor u
          #
          # @param scope [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope] Body param: What the limit applies to. Claude Enterprise organizations set `user
          #
          # @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod] Body param
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaSpendLimit]
          #
          # @see Anthropic::Models::Beta::Organization::SpendLimitSetParams
          def set(params)
            parsed, options = Anthropic::Beta::Organization::SpendLimitSetParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/spend_limits?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaSpendLimit,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @effective = Anthropic::Resources::Beta::Organization::SpendLimits::Effective.new(client: client)
            @increase_requests =
              Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests.new(client: client)
          end
        end
      end
    end
  end
end
