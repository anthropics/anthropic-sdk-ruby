# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class SpendLimits
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::SpendLimits::Effective
            )
          end
          attr_reader :effective

          sig do
            returns(
              Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests
            )
          end
          attr_reader :increase_requests

          # Retrieve a spend limit by ID.
          sig do
            params(
              spend_limit_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaSpendLimit)
          end
          def retrieve(
            # ID of the Spend Limit.
            spend_limit_id,
            request_options: {}
          )
          end

          # List the organization's spend limits.
          #
          # A Claude Console organization's limits come in an order that is stable across
          # pages. A Claude Enterprise organization's are grouped by scope type, in the
          # order `organization`, `seat_tier`, `rbac_group`, `organization_service`, `user`;
          # within a type they come in a fixed order that is not creation order.
          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              scope_type:
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::SpendLimitListParams::ScopeType::OrSymbol
                  ]
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaSpendLimit
              ]
            )
          end
          def list(
            # Query param: Maximum number of limits per page. Defaults to `20`.
            limit: nil,
            # Query param: Opaque cursor from a previous response's `next_page` field.
            page: nil,
            # Query param: Return only limits with these scope types. A Claude Console
            # organization has `organization` and `workspace` limits; a Claude Enterprise
            # organization has `organization`, `seat_tier`, `rbac_group`,
            # `organization_service` and `user` limits. Omit for all.
            scope_type: nil,
            # Header param: This endpoint is in beta: requests must send
            # `spend-limit-reads-2026-09-26` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Delete a spend limit.
          #
          # For a Claude Enterprise organization, this deletes a per-user override, and the
          # member falls back to any inherited spend limit at that period. Its seat-tier,
          # group, and organization-level rows cannot be deleted via this endpoint. A Claude
          # Console organization deletes its organization and workspace limits. Deleting
          # them through the API is in an early access preview.
          sig do
            params(
              spend_limit_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Organization::SpendLimitDeleteResponse
            )
          end
          def delete(
            # ID of the Spend Limit.
            spend_limit_id,
            request_options: {}
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
          sig do
            params(
              amount: T.nilable(String),
              scope:
                T.any(
                  Anthropic::Beta::Organization::BetaSpendLimitUserScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitOrganizationScope::OrHash,
                  Anthropic::Beta::Organization::BetaSpendLimitWorkspaceScope::OrHash
                ),
              period:
                Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaSpendLimit)
          end
          def set(
            # Limit amount as a non-negative integer decimal string in the minor unit of the
            # organization's billing currency (cents for USD): "50000" is $500.00. `null` sets
            # an explicit no-limit override for this scope and `period` only — each period
            # resolves independently, so caps for other periods still apply.
            amount:,
            # What the limit applies to. Claude Enterprise organizations set `user` limits.
            # Claude Console organizations set `organization` and `workspace` limits. Any
            # other combination returns 400. Setting `organization` and `workspace` limits
            # through the API is in an early access preview. To request access, contact your
            # Anthropic account team.
            scope:,
            period: nil,
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
