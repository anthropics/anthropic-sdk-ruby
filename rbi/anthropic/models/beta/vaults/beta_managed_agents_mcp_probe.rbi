# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPProbe < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe,
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

          # The MCP method that failed (for example `initialize` or `tools/list`).
          sig { returns(String) }
          attr_accessor :method_

          # The failing step of an MCP validation probe.
          sig do
            params(
              http_response:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse::OrHash
                ),
              method_: String
            ).returns(T.attached_class)
          end
          def self.new(
            # An HTTP response captured during a credential validation probe.
            http_response:,
            # The MCP method that failed (for example `initialize` or `tools/list`).
            method_:
          )
          end

          sig do
            override.returns(
              {
                http_response:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
                  ),
                method_: String
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
