# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class SpendLimits
          class Effective
            # List each member's effective spend limit and period-to-date spend.
            #
            # Returns one row per (member, period) the member resolves a spend limit for, with
            # the `source` scope the spend limit was inherited from. Paginates by member, so a
            # member's periods never split across pages.
            sig do
              params(
                limit: Integer,
                page: T.nilable(String),
                period:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::SpendLimits::EffectiveListParams::Period::OrSymbol
                    ]
                  ),
                user_ids: T.nilable(T::Array[String]),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::BetaSpendSummary
                ]
              )
            end
            def list(
              # Maximum number of members per page. A member's period rows never split across
              # pages, so a page may carry more rows than this. Defaults to `20`.
              limit: nil,
              # Opaque cursor from a previous response's `next_page` field.
              page: nil,
              # Restrict the report to these limit periods. Omit to return one row per period
              # each member resolves a spend limit for.
              period: nil,
              # Restrict the report to these members, by tagged user ID (`user_...`). At most
              # 100 entries.
              user_ids: nil,
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
