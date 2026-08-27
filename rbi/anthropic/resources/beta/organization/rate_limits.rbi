# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class RateLimits
          # List Messages API rate limits for your organization.
          #
          # Each entry corresponds to one rate-limit group (either a model family or an
          # API-surface category such as the Files API or Message Batches) and contains the
          # set of limiter values that apply to it.
          #
          # When `limit` is omitted, every matching entry is returned in a single page; when
          # `limit` truncates the result, follow `next_page` to fetch the remaining entries.
          sig do
            params(
              group_type:
                T.nilable(
                  Anthropic::Beta::Organization::RateLimitListParams::GroupType::OrSymbol
                ),
              limit: T.nilable(Integer),
              model: T.nilable(String),
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaOrganizationRateLimit
              ]
            )
          end
          def list(
            # Filter by group type.
            group_type: nil,
            # Maximum number of items to return per page. Ranges from `1` to `1000`.
            #
            # When omitted, every remaining entry is returned in a single page and `next_page`
            # is `null`.
            limit: nil,
            # Filter to the single entry containing this model. Accepts full model names and
            # aliases. Returns 404 if the model is not found or has no rate limits for this
            # organization.
            model: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
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
