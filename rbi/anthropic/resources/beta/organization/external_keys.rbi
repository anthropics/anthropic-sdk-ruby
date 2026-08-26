# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ExternalKeys
          # Create an external key config owned by the caller's organization.
          sig do
            params(
              provider_config:
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalKeyConfig::OrHash,
                  Anthropic::Beta::Organization::BetaGCPExternalKeyConfig::OrHash,
                  Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam::OrHash
                ),
              display_name: T.nilable(String),
              geo:
                Anthropic::Beta::Organization::ExternalKeyCreateParams::Geo::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalKey)
          end
          def create(
            # KMS provider identity and auth coordinates.
            provider_config:,
            # Human-friendly display name.
            display_name: nil,
            # Data residency geo. Only `us` is supported.
            geo: nil,
            request_options: {}
          )
          end

          # Retrieve a single external key config in the caller's organization by ID.
          sig do
            params(
              external_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalKey)
          end
          def retrieve(
            # ID of the External Key.
            external_key_id,
            request_options: {}
          )
          end

          # Partially update an external key config. Omitted fields are left unchanged.
          #
          # `display_name` is always editable. `geo` and `provider_config` cannot be changed
          # once any workspace references this config, because previously encrypted data
          # requires the original key identity to decrypt.
          sig do
            params(
              external_key_id: String,
              display_name: T.nilable(String),
              geo:
                T.nilable(
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::OrSymbol
                ),
              provider_config:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaAWSExternalKeyConfig::OrHash,
                    Anthropic::Beta::Organization::BetaGCPExternalKeyConfig::OrHash,
                    Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam::OrHash
                  )
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalKey)
          end
          def update(
            # ID of the External Key.
            external_key_id,
            # Human-friendly display name.
            display_name: nil,
            # Data residency geo. Only `us` is supported.
            geo: nil,
            # KMS provider identity and auth coordinates.
            provider_config: nil,
            request_options: {}
          )
          end

          # List external key configs in the caller's organization.
          #
          # Results are ordered by creation time (newest first). Use the `next_page` cursor
          # from the response to fetch subsequent pages.
          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaExternalKey
              ]
            )
          end
          def list(
            # Number of results per page.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
            request_options: {}
          )
          end

          # Delete an external key config.
          #
          # The request is rejected if any workspace still references this config.
          sig do
            params(
              external_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Organization::ExternalKeyDeleteResponse
            )
          end
          def delete(
            # ID of the External Key.
            external_key_id,
            request_options: {}
          )
          end

          # Validate an external key config against the customer's KMS.
          #
          # Anthropic performs an encrypt/decrypt roundtrip against the configured KMS key
          # and waits up to 30 seconds for the result. The response status is `success` if
          # the roundtrip succeeded, or `failure` with an error message if it failed or
          # timed out.
          sig do
            params(
              external_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Organization::ExternalKeyValidateResponse
            )
          end
          def validate(
            # ID of the External Key.
            external_key_id,
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
