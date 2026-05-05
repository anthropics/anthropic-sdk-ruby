# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Webhooks
        # @param payload [String] The raw webhook payload as a string
        #
        # @param headers [Hash{String=>String}] The raw HTTP headers that came with the payload
        #
        # @param key [String, nil] The webhook signing key
        #
        # @return [Anthropic::Models::Beta::UnwrapWebhookEvent]
        def unwrap(payload, headers:, key: @client.webhook_key)
          if key.nil?
            raise ArgumentError.new("Cannot verify a webhook without a key on either the client's webhook_key or passed in as an argument")
          end

          ::StandardWebhooks::Webhook.new(key).verify(payload, headers)

          parsed = JSON.parse(payload, symbolize_names: true)
          Anthropic::Internal::Type::Converter.coerce(Anthropic::Models::Beta::UnwrapWebhookEvent, parsed)
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
