# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ExternalKeys
          # Create an external key config owned by the caller's organization.
          #
          # @overload create(provider_config:, display_name: nil, geo: nil, request_options: {})
          #
          # @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam] KMS provider identity and auth coordinates.
          #
          # @param display_name [String, nil] Human-friendly display name.
          #
          # @param geo [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyCreateParams::Geo] Data residency geo. Only `us` is supported.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalKey]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::ExternalKeyCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: "v1/organizations/external_keys?beta=true",
              body: parsed,
              model: Anthropic::Beta::Organization::BetaExternalKey,
              options: options
            )
          end

          # Retrieve a single external key config in the caller's organization by ID.
          #
          # @overload retrieve(external_key_id, request_options: {})
          #
          # @param external_key_id [String] ID of the External Key.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalKey]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyRetrieveParams
          def retrieve(external_key_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/external_keys/%1$s?beta=true", external_key_id],
              model: Anthropic::Beta::Organization::BetaExternalKey,
              options: params[:request_options]
            )
          end

          # Partially update an external key config. Omitted fields are left unchanged.
          #
          # `display_name` is always editable. `geo` and `provider_config` cannot be changed
          # once any workspace references this config, because previously encrypted data
          # requires the original key identity to decrypt.
          #
          # @overload update(external_key_id, display_name: nil, geo: nil, provider_config: nil, request_options: {})
          #
          # @param external_key_id [String] ID of the External Key.
          #
          # @param display_name [String, nil] Human-friendly display name.
          #
          # @param geo [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyUpdateParams::Geo, nil] Data residency geo. Only `us` is supported.
          #
          # @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam, nil] KMS provider identity and auth coordinates.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaExternalKey]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyUpdateParams
          def update(external_key_id, params = {})
            parsed, options = Anthropic::Beta::Organization::ExternalKeyUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/external_keys/%1$s?beta=true", external_key_id],
              body: parsed,
              model: Anthropic::Beta::Organization::BetaExternalKey,
              options: options
            )
          end

          # List external key configs in the caller's organization.
          #
          # Results are ordered by creation time (newest first). Use the `next_page` cursor
          # from the response to fetch subsequent pages.
          #
          # @overload list(limit: nil, page: nil, request_options: {})
          #
          # @param limit [Integer] Number of results per page.
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaExternalKey>]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::ExternalKeyListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/external_keys?beta=true",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaExternalKey,
              options: options
            )
          end

          # Delete an external key config.
          #
          # The request is rejected if any workspace still references this config.
          #
          # @overload delete(external_key_id, request_options: {})
          #
          # @param external_key_id [String] ID of the External Key.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::ExternalKeyDeleteResponse]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyDeleteParams
          def delete(external_key_id, params = {})
            @client.request(
              method: :delete,
              path: ["v1/organizations/external_keys/%1$s?beta=true", external_key_id],
              model: Anthropic::Models::Beta::Organization::ExternalKeyDeleteResponse,
              options: params[:request_options]
            )
          end

          # Validate an external key config against the customer's KMS.
          #
          # Anthropic performs an encrypt/decrypt roundtrip against the configured KMS key
          # and waits up to 30 seconds for the result. The response status is `success` if
          # the roundtrip succeeded, or `failure` with an error message if it failed or
          # timed out.
          #
          # @overload validate(external_key_id, request_options: {})
          #
          # @param external_key_id [String] ID of the External Key.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse]
          #
          # @see Anthropic::Models::Beta::Organization::ExternalKeyValidateParams
          def validate(external_key_id, params = {})
            @client.request(
              method: :post,
              path: ["v1/organizations/external_keys/%1$s/validate?beta=true", external_key_id],
              model: Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse,
              options: params[:request_options]
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
