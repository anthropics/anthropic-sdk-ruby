# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#regenerate_signing_secret
        class WebhookRegenerateSigningSecretParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute webhook_endpoint_id
          #   ID of the webhook endpoint.
          #
          #   @return [String]
          required :webhook_endpoint_id, String

          # @!attribute betas
          #   This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(webhook_endpoint_id:, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WebhookRegenerateSigningSecretParams}
          #   for more details.
          #
          #   @param webhook_endpoint_id [String] ID of the webhook endpoint.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
