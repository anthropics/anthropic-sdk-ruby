# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Compliance
        class Review
          class Items
            # Read one message that Anthropic flagged for your organization to review, with
            # its request and response.
            #
            # A message that the API key can't read, or that isn't flagged, returns the same
            # 404 as one that doesn't exist. For a message recorded with a user profile, send
            # that profile's ID in the `anthropic-user-profile-id` header. A flagged message
            # can also return 404 if it belongs to another organization than the key's own, or
            # to your end customer's user profile or Workspace.
            #
            # If your encryption key or storage bucket refuses the read, the API returns a 400
            # with `cmek_key_disabled`, `storage_bucket_unreadable` or
            # `customer_storage_refusal_unattributed` in `error.details.error_code`.
            #
            # The API key must have the `read:compliance_review_items`,
            # `read:compliance_user_data` or `read:org_audit` scope. A key of an organization
            # with no parent organization must have `read:compliance_review_items`.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Compliance::Review::ItemRetrieveParams} for more
            # details.
            #
            # @overload retrieve(item_id, betas: nil, user_profile_id: nil, request_options: {})
            #
            # @param item_id [String] The ID of the item. For a message, its ID as the client received it or as a revi
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param user_profile_id [String] The ID of the user profile that the message was recorded with (`uprof_...`). Sen
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewItem]
            #
            # @see Anthropic::Models::Beta::Compliance::Review::ItemRetrieveParams
            def retrieve(item_id, params = {})
              parsed, options = Anthropic::Beta::Compliance::Review::ItemRetrieveParams.dump_request(params)
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::COMPLIANCE_REVIEW_ITEMS_RETRIEVE,
                span_attributes: {"anthropic.compliance.review.item.id" => item_id},
                span_route: "/v1/compliance/review/items/{item_id}",
                method: :get,
                path: ["v1/compliance/review/items/%1$s", item_id],
                headers: parsed.transform_keys(
                  betas: "anthropic-beta",
                  user_profile_id: "anthropic-user-profile-id"
                ),
                model: Anthropic::Beta::Compliance::Review::BetaComplianceReviewItem,
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
