# typed: strong

module Anthropic
  module Resources
    class Beta
      class Webhooks
        # Parses a webhook payload into an event without verifying its signature. Prefer
        # `unwrap()` unless you have already verified the signature yourself.
        sig do
          params(payload: String).returns(Anthropic::Beta::BetaWebhookEvent)
        end
        def parse_unverified(
          # The raw webhook payload as a string
          payload
        )
        end

        # Verifies the webhook signature from the `webhook-id`, `webhook-timestamp` and
        # `webhook-signature` headers using your webhook signing key, then parses the
        # payload into an event. Fails if the signature is missing or invalid.
        sig do
          params(
            payload: String,
            headers: T::Hash[String, String],
            key: T.nilable(String)
          ).returns(Anthropic::Beta::BetaWebhookEvent)
        end
        def unwrap(
          # The raw webhook payload as a string
          payload,
          # The raw HTTP headers that came with the payload
          headers:,
          # The webhook signing key
          key: @client.webhook_key
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
