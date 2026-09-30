# typed: strong

module Anthropic
  module Models
    module Organization
      class ServiceAccountArchiveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ServiceAccountArchiveParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the service account to archive.
        sig { returns(String) }
        attr_accessor :service_account_id

        sig do
          params(
            service_account_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the service account to archive.
          service_account_id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              service_account_id: String,
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
