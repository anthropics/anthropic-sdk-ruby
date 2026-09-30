# typed: strong

module Anthropic
  module Models
    module Organization
      module Federation
        class IssuerRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Federation::IssuerRetrieveParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the federation issuer.
          sig { returns(String) }
          attr_accessor :federation_issuer_id

          sig do
            params(
              federation_issuer_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the federation issuer.
            federation_issuer_id:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                federation_issuer_id: String,
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
