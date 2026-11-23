# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ExternalStorage
          # Register a bucket in the organization's own cloud account. It is saved as
          # `pending_configuration` and verified when activated.
          sig do
            params(
              provider_config:
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam::OrHash,
                  Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam::OrHash
                ),
              display_name: T.nilable(String),
              user_profile_id: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalStorage)
          end
          def create(
            # Body param
            provider_config:,
            # Body param: Human-friendly display name.
            display_name: nil,
            # Body param: The user profile to bind the storage to. It can't be changed later.
            # The storage can be attached only to Workspaces with this profile, and the
            # bucket's setup must name the same ID.
            user_profile_id: nil,
            # Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in
            # this header.
            betas: nil,
            request_options: {}
          )
          end

          # Get one External Storage in the organization.
          sig do
            params(
              external_storage_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalStorage)
          end
          def retrieve(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Rename External Storage or clear its name, in any status.
          sig do
            params(
              external_storage_id: String,
              display_name: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalStorage)
          end
          def update(
            # Path param: The External Storage ID, which starts with `estrg_`. Through Claude
            # Platform on AWS, storage whose `provider_config.type` is `aws` has its bucket
            # ARN as its ID instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>`
            # is the partition of the bucket's region.
            external_storage_id,
            # Body param: Human-friendly display name; null clears it.
            display_name:,
            # Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in
            # this header.
            betas: nil,
            request_options: {}
          )
          end

          # List the organization's External Storage, newest first.
          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              user_profile_ids: T.nilable(T::Array[String]),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaExternalStorage
              ]
            )
          end
          def list(
            # Query param: Number of results per page.
            limit: nil,
            # Query param: Opaque cursor from a previous response's `next_page`.
            page: nil,
            # Query param: Returns only External Storage bound to one of these user profile
            # IDs (`uprof_...`). An empty entry matches storage bound to no user profile. At
            # most 10 entries, counting repeats.
            user_profile_ids: nil,
            # Header param: This endpoint is in beta: requests must send `efs-2026-10-01` in
            # this header.
            betas: nil,
            request_options: {}
          )
          end

          # Delete External Storage. Storage that is pending configuration, available, or
          # active but never attached is deleted at once, unless an Enterprise Frontier
          # Safeguards workspace policy lists it. Other storage gets a 400 that says what to
          # do next. On `draining` storage that 400 can mean this delete started a removal
          # that can't be undone. To check, get the storage: if `status.removal_started` is
          # true, delete it again later to finish.
          sig do
            params(
              external_storage_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaDeletedExternalStorage)
          end
          def delete(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          # Verify pending External Storage and make it available. Storage that is already
          # available, active or draining comes back unchanged, without any check.
          sig do
            params(
              external_storage_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaExternalStorage)
          end
          def activate(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
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
