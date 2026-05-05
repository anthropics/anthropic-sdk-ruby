# typed: strong

module Anthropic
  module Resources
    class Beta
      class Webhooks
        sig do
          params(
            payload: String,
            headers: T::Hash[String, String],
            key: T.nilable(String)
          ).returns(Anthropic::Beta::UnwrapWebhookEvent)
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
