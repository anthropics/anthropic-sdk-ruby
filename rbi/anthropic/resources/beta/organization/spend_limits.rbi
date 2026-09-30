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
