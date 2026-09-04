# typed: strong

module Anthropic
  module Models
    module Beta
      module Tunnels
        class CertificateCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Tunnels::CertificateCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :tunnel_id

          # PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no
          # private-key material. Maximum 8KB.
          sig { returns(String) }
          attr_accessor :ca_certificate_pem

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig { returns(T.nilable(String)) }
          attr_reader :workspace_id

          sig { params(workspace_id: String).void }
          attr_writer :workspace_id

          sig do
            params(
              tunnel_id: String,
              ca_certificate_pem: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            tunnel_id:,
            # PEM-encoded X.509 CA certificate. Must contain exactly one certificate and no
            # private-key material. Maximum 8KB.
            ca_certificate_pem:,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                tunnel_id: String,
                ca_certificate_pem: String,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                workspace_id: String,
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
