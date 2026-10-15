# typed: strong

module Anthropic
  module Models
    module Beta
      module Agents
        class VersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Agents::VersionListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Agent ID to list versions for.
          sig { returns(String) }
          attr_accessor :agent_id

          # Maximum results per page. Default 20, maximum 100.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque pagination cursor.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
          # header.
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

          # Optional header to select the Workspace for this request. The value is a
          # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          sig { returns(T.nilable(String)) }
          attr_reader :workspace_id

          sig { params(workspace_id: String).void }
          attr_writer :workspace_id

          sig do
            params(
              agent_id: String,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Agent ID to list versions for.
            agent_id:,
            # Maximum results per page. Default 20, maximum 100.
            limit: nil,
            # Opaque pagination cursor.
            page: nil,
            # This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
            # header.
            betas: nil,
            # Optional header to select the Workspace for this request. The value is a
            # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
            #
            # Only needed for credentials that can act on more than one Workspace. A
            # credential that belongs to a specific Workspace may omit it; if sent, it must
            # match that Workspace.
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                agent_id: String,
                limit: Integer,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
