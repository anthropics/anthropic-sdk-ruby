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
          # @overload set(amount:, scope:, period: nil, request_options: {})
          #
          # @param amount [String, nil] Limit amount as a non-negative integer decimal string in the minor unit of the o
          #
          # @param scope [Anthropic::Models::Beta::Organization::BetaSpendLimitUserScope, Anthropic::Models::Beta::Organization::BetaSpendLimitOrganizationScope, Anthropic::Models::Beta::Organization::BetaSpendLimitWorkspaceScope] What the limit applies to. Claude Enterprise organizations set `user` limits. Cl
          #
          # @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod]
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaSpendLimit]
          #
          # @see Anthropic::Models::Beta::Organization::SpendLimitSetParams
          def set(params)
            parsed, options = Anthropic::Beta::Organization::SpendLimitSetParams.dump_request(params)
            @client.request(
              method: :post,
              path: "v1/organizations/spend_limits?beta=true",
              body: parsed,
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
