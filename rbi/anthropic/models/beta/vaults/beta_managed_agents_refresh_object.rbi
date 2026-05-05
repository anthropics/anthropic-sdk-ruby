# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsRefreshObject < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject,
                Anthropic::Internal::AnyHash
              )
            end

          # An HTTP response captured during a credential validation probe.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
              )
            )
          end
          attr_reader :http_response

          sig do
            params(
              http_response:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse::OrHash
                )
            ).void
          end
          attr_writer :http_response

          # Outcome of a refresh-token exchange attempted during credential validation.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # Outcome of a refresh-token exchange attempted during credential validation.
          sig do
            params(
              http_response:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse::OrHash
                ),
              status:
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # An HTTP response captured during a credential validation probe.
            http_response:,
            # Outcome of a refresh-token exchange attempted during credential validation.
            status:
          )
          end

          sig do
            override.returns(
              {
                http_response:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
                  ),
                status:
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Outcome of a refresh-token exchange attempted during credential validation.
          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCEEDED =
              T.let(
                :succeeded,
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
              )
            CONNECT_ERROR =
              T.let(
                :connect_error,
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
              )
            NO_REFRESH_TOKEN =
              T.let(
                :no_refresh_token,
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
