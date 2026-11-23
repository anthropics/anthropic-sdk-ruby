# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalStorageActivateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalStorageActivateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          # partition of the bucket's region.
          sig { returns(String) }
          attr_accessor :external_storage_id

          # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              external_storage_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            external_storage_id:,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                external_storage_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
