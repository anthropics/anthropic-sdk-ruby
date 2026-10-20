# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Webhooks
          # Create an organization webhook endpoint.
          #
          # An organization webhook endpoint belongs to the organization rather than to one
          # of its workspaces. An organization can have at most 32 organization webhook
          # endpoints, enabled or disabled.
          #
          # The response includes the endpoint's signing secret. No read returns it, so
          # store it when you receive it.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookCreateParams} for more details.
          #
          # @overload create(enabled_events:, url:, description: nil, name: nil, betas: nil, request_options: {})
          #
          # @param enabled_events [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookCreateParams::EnabledEvent>] Body param: The event types to deliver to the endpoint. Must list at least one.
          #
          # @param url [String] Body param: The HTTPS URL that deliveries are sent to.
          #
          # @param description [String] Body param: Notes about the endpoint.
          #
          # @param name [String] Body param: A short label for the endpoint.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaNewOrganizationWebhookEndpoint]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::WebhookCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_CREATE,
              span_created_id: "anthropic.organization.webhook.id",
              span_route: "/v1/organizations/webhooks",
              method: :post,
              path: "v1/organizations/webhooks?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaNewOrganizationWebhookEndpoint,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
            )
          end

          # Retrieve an organization webhook endpoint by ID.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookRetrieveParams} for more details.
          #
          # @overload retrieve(webhook_endpoint_id, betas: nil, request_options: {})
          #
          # @param webhook_endpoint_id [String] ID of the webhook endpoint.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpoint]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookRetrieveParams
          def retrieve(webhook_endpoint_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WebhookRetrieveParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_RETRIEVE,
              span_attributes: {"anthropic.organization.webhook.id" => webhook_endpoint_id},
              span_route: "/v1/organizations/webhooks/{webhook_endpoint_id}",
              method: :get,
              path: ["v1/organizations/webhooks/%1$s?beta=true", webhook_endpoint_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
            )
          end

          # Update an organization webhook endpoint. Only the fields you send are changed.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookUpdateParams} for more details.
          #
          # @overload update(webhook_endpoint_id, description: nil, enabled_events: nil, name: nil, state: nil, url: nil, betas: nil, request_options: {})
          #
          # @param webhook_endpoint_id [String] Path param: ID of the webhook endpoint.
          #
          # @param description [String] Body param: Notes about the endpoint.
          #
          # @param enabled_events [Array<Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::EnabledEvent>] Body param: The event types to deliver to the endpoint. Replaces the whole set;
          #
          # @param name [String] Body param: A short label for the endpoint.
          #
          # @param state [Symbol, Anthropic::Models::Beta::Organization::WebhookUpdateParams::State] Body param: `disabled` stops deliveries. `enabled` resumes them and clears `disa
          #
          # @param url [String] Body param: The HTTPS URL that deliveries are sent to.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpoint]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookUpdateParams
          def update(webhook_endpoint_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WebhookUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_UPDATE,
              span_attributes: {"anthropic.organization.webhook.id" => webhook_endpoint_id},
              span_route: "/v1/organizations/webhooks/{webhook_endpoint_id}",
              method: :post,
              path: ["v1/organizations/webhooks/%1$s?beta=true", webhook_endpoint_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
            )
          end

          # List the organization's webhook endpoints.
          #
          # An organization webhook endpoint belongs to the organization rather than to one
          # of its workspaces. The list does not include webhook endpoints that belong to a
          # workspace.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookListParams} for more details.
          #
          # @overload list(after_id: nil, before_id: nil, limit: nil, order: nil, betas: nil, request_options: {})
          #
          # @param after_id [String, nil] Query param: ID of the object to use as a cursor for pagination. When provided,
          #
          # @param before_id [String, nil] Query param: ID of a webhook endpoint to use as a cursor. Returns the first `lim
          #
          # @param limit [Integer] Query param: Number of items to return per page, up to `100`. The default, `0`,
          #
          # @param order [Symbol, Anthropic::Models::Beta::Organization::WebhookListParams::Order, nil] Query param: Sort order by `created_at`. Defaults to `desc`, newest first.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpoint>]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookListParams
          def list(params = {})
            query_params = [:after_id, :before_id, :limit, :order]
            parsed, options = Anthropic::Beta::Organization::WebhookListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_LIST,
              span_route: "/v1/organizations/webhooks",
              span_query: %w[after_id before_id limit order],
              method: :get,
              path: "v1/organizations/webhooks?beta=true",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::Page,
              model: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
            )
          end

          # Delete an organization webhook endpoint.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookDeleteParams} for more details.
          #
          # @overload delete(webhook_endpoint_id, betas: nil, request_options: {})
          #
          # @param webhook_endpoint_id [String] ID of the webhook endpoint.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaDeletedOrganizationWebhookEndpoint]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookDeleteParams
          def delete(webhook_endpoint_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WebhookDeleteParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_DELETE,
              span_attributes: {"anthropic.organization.webhook.id" => webhook_endpoint_id},
              span_route: "/v1/organizations/webhooks/{webhook_endpoint_id}",
              method: :delete,
              path: ["v1/organizations/webhooks/%1$s?beta=true", webhook_endpoint_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaDeletedOrganizationWebhookEndpoint,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
            )
          end

          # Replace an organization webhook endpoint's signing secret. The old secret stops
          # working immediately. The new secret is returned only in this response.
          #
          # Every request must include the beta header
          # `anthropic-beta: webhooks-2026-10-07`. A request without it returns `404`,
          # exactly as if this API did not exist. Anthropic turns organization webhook
          # endpoints on for each organization; until yours is on, requests also return
          # `404`. Organization webhook endpoints are in beta and are not available to
          # organizations with HIPAA readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WebhookRegenerateSigningSecretParams}
          # for more details.
          #
          # @overload regenerate_signing_secret(webhook_endpoint_id, betas: nil, request_options: {})
          #
          # @param webhook_endpoint_id [String] ID of the webhook endpoint.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `webhooks-2026-10-07` in this heade
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret]
          #
          # @see Anthropic::Models::Beta::Organization::WebhookRegenerateSigningSecretParams
          def regenerate_signing_secret(webhook_endpoint_id, params = {})
            parsed, options =
              Anthropic::Beta::Organization::WebhookRegenerateSigningSecretParams.dump_request(params)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WEBHOOKS_REGENERATE_SIGNING_SECRET,
              span_attributes: {"anthropic.organization.webhook.id" => webhook_endpoint_id},
              span_route: "/v1/organizations/webhooks/{webhook_endpoint_id}/regenerate_signing_secret",
              method: :post,
              path: [
                "v1/organizations/webhooks/%1$s/regenerate_signing_secret?beta=true",
                webhook_endpoint_id
              ],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret,
              options: {extra_headers: {"anthropic-beta" => "webhooks-2026-10-07"}, **options}
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
