# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalKeyRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalKeyRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the External Key.
          sig { returns(String) }
          attr_accessor :external_key_id

          sig do
            params(
              external_key_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the External Key.
            external_key_id:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                external_key_id: String,
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
