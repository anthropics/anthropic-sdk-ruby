# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class APIKeyRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::APIKeyRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the API key.
          sig { returns(String) }
          attr_accessor :api_key_id

          sig do
            params(
              api_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the API key.
            api_key_id:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              { api_key_id: String, request_options: Anthropic::RequestOptions }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
