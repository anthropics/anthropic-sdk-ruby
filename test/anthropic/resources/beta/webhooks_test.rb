# frozen_string_literal: true

require_relative "../../test_helper"

class Anthropic::Test::Resources::Beta::WebhooksTest < Anthropic::Test::ResourceTest
  def test_unwrap
    key = "whsec_c2VjcmV0Cg=="

    webhook = StandardWebhooks::Webhook.new(key)

    data =
      "{\"id\":\"whe_0f1e2d3c4b5a69788796a5b4c3d2e1f0\",\"created_at\":\"2026-03-15T10:00:00Z\",\"data\":{\"id\":\"sesn_011CZkZAtmR3yMPDzynEDxu7\",\"organization_id\":\"org_011CZkZZAe0sMna4vkBdtrfx\",\"type\":\"session.status_idled\",\"workspace_id\":\"wrkspc_011CZkZaBF1tNoB5wlCeusgy\"},\"type\":\"event\"}"
    message_id = "1"
    timestamp = Time.now.to_i.to_s
    signature = webhook.sign(message_id, timestamp, data)
    headers =
      {"webhook-id" => message_id, "webhook-timestamp" => timestamp, "webhook-signature" => signature}

    @anthropic.beta.webhooks.unwrap(data, headers: headers, key: key)

    bad_headers = [
      headers.merge("webhook-id" => "bad"),
      headers.merge("webhook-timestamp" => "0"),
      headers.merge("webhook-signature" => webhook.sign(message_id, timestamp, "xxx"))
    ]
    bad_headers.each do |bad_header|
      assert_raises(StandardWebhooks::WebhookVerificationError) do
        @anthropic.beta.webhooks.unwrap(data, headers: bad_header, key: key)
      end
    end
  end

  def test_unwrap_with_mixed_case_headers
    key = "whsec_c2VjcmV0Cg=="
    data =
      "{\"id\":\"whe_0f1e2d3c4b5a69788796a5b4c3d2e1f0\",\"created_at\":\"2026-03-15T10:00:00Z\",\"data\":{\"id\":\"sesn_011CZkZAtmR3yMPDzynEDxu7\",\"organization_id\":\"org_011CZkZZAe0sMna4vkBdtrfx\",\"type\":\"session.status_idled\",\"workspace_id\":\"wrkspc_011CZkZaBF1tNoB5wlCeusgy\"},\"type\":\"event\"}"
    timestamp = Time.now.to_i.to_s
    signature = StandardWebhooks::Webhook.new(key).sign("1", timestamp, data)
    headers = {"Webhook-Id" => "1", "Webhook-Timestamp" => timestamp, "Webhook-Signature" => signature}

    response = @anthropic.beta.webhooks.unwrap(data, headers: headers, key: key)

    assert_pattern do
      response => Anthropic::Beta::BetaWebhookEvent
    end
  end
end
