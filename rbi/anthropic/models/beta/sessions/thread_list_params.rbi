# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class ThreadListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::ThreadListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :session_id

          # Maximum results per page. Defaults to 1000.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque pagination cursor from a previous response's `next_page`. Forward-only.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Return only threads that have one of these statuses.
          #
          # Repeat the parameter to give more than one status. Leave it out to return
          # threads of every status.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::OrSymbol
                ]
              )
            )
          end
          attr_reader :statuses

          sig do
            params(
              statuses:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::OrSymbol
                ]
            ).void
          end
          attr_writer :statuses

          # Optional header to specify the beta version(s) you want to use.
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
              session_id: String,
              limit: Integer,
              page: String,
              statuses:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::OrSymbol
                ],
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            session_id:,
            # Maximum results per page. Defaults to 1000.
            limit: nil,
            # Opaque pagination cursor from a previous response's `next_page`. Forward-only.
            page: nil,
            # Return only threads that have one of these statuses.
            #
            # Repeat the parameter to give more than one status. Leave it out to return
            # threads of every status.
            statuses: nil,
            # Optional header to specify the beta version(s) you want to use.
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
                session_id: String,
                limit: Integer,
                page: String,
                statuses:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus::OrSymbol
                  ],
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
