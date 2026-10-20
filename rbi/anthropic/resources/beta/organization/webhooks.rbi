# typed: strong

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
          sig do
            params(
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::WebhookCreateParams::EnabledEvent::OrSymbol
                ],
              url: String,
              description: String,
              name: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaNewOrganizationWebhookEndpoint
            )
          end
          def create(
            # Body param: The event types to deliver to the endpoint. Must list at least one.
            enabled_events:,
            # Body param: The HTTPS URL that deliveries are sent to.
            url:,
            # Body param: Notes about the endpoint.
            description: nil,
            # Body param: A short label for the endpoint.
            name: nil,
            # Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
            # in this header.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              webhook_endpoint_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
            )
          end
          def retrieve(
            # ID of the webhook endpoint.
            webhook_endpoint_id,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              webhook_endpoint_id: String,
              description: String,
              enabled_events:
                T::Array[
                  Anthropic::Beta::Organization::WebhookUpdateParams::EnabledEvent::OrSymbol
                ],
              name: String,
              state:
                Anthropic::Beta::Organization::WebhookUpdateParams::State::OrSymbol,
              url: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
            )
          end
          def update(
            # Path param: ID of the webhook endpoint.
            webhook_endpoint_id,
            # Body param: Notes about the endpoint.
            description: nil,
            # Body param: The event types to deliver to the endpoint. Replaces the whole set;
            # an empty list leaves it unchanged.
            enabled_events: nil,
            # Body param: A short label for the endpoint.
            name: nil,
            # Body param: `disabled` stops deliveries. `enabled` resumes them and clears
            # `disabled_reason`. Events that happen while the endpoint is disabled are never
            # delivered.
            state: nil,
            # Body param: The HTTPS URL that deliveries are sent to.
            url: nil,
            # Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
            # in this header.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              after_id: T.nilable(String),
              before_id: T.nilable(String),
              limit: Integer,
              order:
                T.nilable(
                  Anthropic::Beta::Organization::WebhookListParams::Order::OrSymbol
                ),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Page[
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpoint
              ]
            )
          end
          def list(
            # Query param: ID of the object to use as a cursor for pagination. When provided,
            # returns the page of results immediately after this object.
            after_id: nil,
            # Query param: ID of a webhook endpoint to use as a cursor. Returns the first
            # `limit` endpoints that come before it in list order, not the `limit` endpoints
            # just before it.
            before_id: nil,
            # Query param: Number of items to return per page, up to `100`. The default, `0`,
            # means `20`.
            limit: nil,
            # Query param: Sort order by `created_at`. Defaults to `desc`, newest first.
            order: nil,
            # Header param: This endpoint is in beta: requests must send `webhooks-2026-10-07`
            # in this header.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              webhook_endpoint_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaDeletedOrganizationWebhookEndpoint
            )
          end
          def delete(
            # ID of the webhook endpoint.
            webhook_endpoint_id,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
            request_options: {}
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
          sig do
            params(
              webhook_endpoint_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret
            )
          end
          def regenerate_signing_secret(
            # ID of the webhook endpoint.
            webhook_endpoint_id,
            # This endpoint is in beta: requests must send `webhooks-2026-10-07` in this
            # header.
            betas: nil,
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
