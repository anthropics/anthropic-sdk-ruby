# frozen_string_literal: true

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
            # member's periods never split across pages. Listing Claude Console limits is in
            # an early access preview. To request access, contact your Anthropic account team.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams} for
            # more details.
            #
            # @overload list(limit: nil, page: nil, period: nil, user_ids: nil, request_options: {})
            #
            # @param limit [Integer] Maximum number of members per page. A member's period rows never split across pa
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            # @param period [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams::Period>, nil] Restrict the report to these limit periods. Omit to return one row per period ea
            #
            # @param user_ids [Array<String>, nil] Restrict the report to these members, by tagged user ID (`user_...`). At most 10
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaSpendSummary>]
            #
            # @see Anthropic::Models::Beta::Organization::SpendLimits::EffectiveListParams
            def list(params = {})
              parsed, options = Anthropic::Beta::Organization::SpendLimits::EffectiveListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/spend_limits/effective?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaSpendSummary,
                options: options
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
