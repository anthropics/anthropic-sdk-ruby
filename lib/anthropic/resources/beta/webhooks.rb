# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Webhooks
        # Parses a webhook payload into an event without verifying its signature. Prefer
        # `unwrap()` unless you have already verified the signature yourself.
        #
        # @param payload [String] The raw webhook payload as a string
        #
        # @return [Anthropic::Models::Beta::BetaWebhookEvent]
        def parse_unverified(payload)
          parsed = JSON.parse(payload, symbolize_names: true)
          Anthropic::Internal::Type::Converter.coerce(Anthropic::Models::Beta::BetaWebhookEvent, parsed)
        end

        # Verifies the webhook signature from the `webhook-id`, `webhook-timestamp` and
        # `webhook-signature` headers using your webhook signing key, then parses the
        # payload into an event. Fails if the signature is missing or invalid.
        #
        # @param payload [String] The raw webhook payload as a string
        #
        # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
        #
        # @param key [String, nil] The webhook signing key
        #
        # @return [Anthropic::Models::Beta::BetaWebhookEvent]
        def unwrap(payload, headers:, key: @client.webhook_key)
          if key.nil?
            raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_key or passed in as an argument")
          end

          ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

          parsed = JSON.parse(payload, symbolize_names: true)
          Anthropic::Internal::Type::Converter.coerce(Anthropic::Models::Beta::BetaWebhookEvent, parsed)
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
