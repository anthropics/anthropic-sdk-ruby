# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#list
        class WebhookListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute after_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          #
          #   @return [String, nil]
          optional :after_id, String, nil?: true

          # @!attribute before_id
          #   ID of a webhook endpoint to use as a cursor. Returns the first `limit` endpoints
          #   that come before it in list order, not the `limit` endpoints just before it.
          #
          #   @return [String, nil]
          optional :before_id, String, nil?: true

          # @!attribute limit
          #   Number of items to return per page, up to `100`. The default, `0`, means `20`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute order
          #   Sort order by `created_at`. Defaults to `desc`, newest first.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::WebhookListParams::Order, nil]
          optional :order, enum: -> { Anthropic::Beta::Organization::WebhookListParams::Order }, nil?: true

          # @!attribute betas
          #   This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
          #   header.
          #
          #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(after_id: nil, before_id: nil, limit: nil, order: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::WebhookListParams} for more details.
          #
          #   @param after_id [String, nil] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param before_id [String, nil] ID of a webhook endpoint to use as a cursor. Returns the first `limit` endpoints
          #
          #   @param limit [Integer] Number of items to return per page, up to `100`. The default, `0`, means `20`.
          #
          #   @param order [Symbol, Anthropic::Models::Beta::Organization::WebhookListParams::Order, nil] Sort order by `created_at`. Defaults to `desc`, newest first.
          #
          #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Sort order by `created_at`. Defaults to `desc`, newest first.
          module Order
            extend Anthropic::Internal::Type::Enum

            ASC = :asc
            DESC = :desc

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
