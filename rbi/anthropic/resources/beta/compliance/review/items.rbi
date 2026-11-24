# typed: strong

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
            sig do
              params(
                item_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                user_profile_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewItem
              )
            end
            def retrieve(
              # The ID of the item. For a message, its ID as the client received it or as a
              # review case lists it, such as `msg_...`.
              item_id,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              # The ID of the user profile that the message was recorded with (`uprof_...`).
              # Send it for a message recorded with a user profile, and leave it out for a
              # message recorded with none.
              user_profile_id: nil,
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
