# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryVersionListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryVersionListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # The ID of the memory store whose version history to list (`memstore_...`).
          sig { returns(String) }
          attr_accessor :memory_store_id

          # Return only versions written with the API key that has this ID.
          sig { returns(T.nilable(String)) }
          attr_reader :api_key_id

          sig { params(api_key_id: String).void }
          attr_writer :api_key_id

          # Return versions created at or after this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_gte

          sig { params(created_at_gte: Time).void }
          attr_writer :created_at_gte

          # Return versions created at or before this time (inclusive).
          sig { returns(T.nilable(Time)) }
          attr_reader :created_at_lte

          sig { params(created_at_lte: Time).void }
          attr_writer :created_at_lte

          # The maximum number of versions to return per page. Defaults to 20.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Return only versions of the memory with this ID (`mem_...`).
          #
          # The filter still works after the memory is deleted. The results then include the
          # version whose `operation` is `deleted`.
          sig { returns(T.nilable(String)) }
          attr_reader :memory_id

          sig { params(memory_id: String).void }
          attr_writer :memory_id

          # Return only versions that record this kind of change.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol
              )
            )
          end
          attr_reader :operation

          sig do
            params(
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol
            ).void
          end
          attr_writer :operation

          # The `next_page` value from a previous response, to get the next page. Omit it to
          # get the first page.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Return only versions written by the service account with this ID (`svac_...`).
          sig { returns(T.nilable(String)) }
          attr_reader :service_account_id

          sig { params(service_account_id: String).void }
          attr_writer :service_account_id

          # Return only versions written by the session with this ID.
          sig { returns(T.nilable(String)) }
          attr_reader :session_id

          sig { params(session_id: String).void }
          attr_writer :session_id

          # Selects which projection of a `memory` or `memory_version` the server returns.
          # `basic` returns the object with `content` set to `null`; `full` populates
          # `content`. When omitted, the default is endpoint-specific: retrieve operations
          # default to `full`; list, create, and update operations default to `basic`.
          # Listing with `view=full` caps `limit` at 20.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
              )
            )
          end
          attr_reader :view

          sig do
            params(
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol
            ).void
          end
          attr_writer :view

          # This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
          # `managed-agents-2026-04-01` in this header.
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
              memory_store_id: String,
              api_key_id: String,
              created_at_gte: Time,
              created_at_lte: Time,
              limit: Integer,
              memory_id: String,
              operation:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
              page: String,
              service_account_id: String,
              session_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              workspace_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The ID of the memory store whose version history to list (`memstore_...`).
            memory_store_id:,
            # Return only versions written with the API key that has this ID.
            api_key_id: nil,
            # Return versions created at or after this time (inclusive).
            created_at_gte: nil,
            # Return versions created at or before this time (inclusive).
            created_at_lte: nil,
            # The maximum number of versions to return per page. Defaults to 20.
            limit: nil,
            # Return only versions of the memory with this ID (`mem_...`).
            #
            # The filter still works after the memory is deleted. The results then include the
            # version whose `operation` is `deleted`.
            memory_id: nil,
            # Return only versions that record this kind of change.
            operation: nil,
            # The `next_page` value from a previous response, to get the next page. Omit it to
            # get the first page.
            page: nil,
            # Return only versions written by the service account with this ID (`svac_...`).
            service_account_id: nil,
            # Return only versions written by the session with this ID.
            session_id: nil,
            # Selects which projection of a `memory` or `memory_version` the server returns.
            # `basic` returns the object with `content` set to `null`; `full` populates
            # `content`. When omitted, the default is endpoint-specific: retrieve operations
            # default to `full`; list, create, and update operations default to `basic`.
            # Listing with `view=full` caps `limit` at 20.
            view: nil,
            # This endpoint is in beta: requests must send `agent-memory-2026-07-22` or
            # `managed-agents-2026-04-01` in this header.
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
                memory_store_id: String,
                api_key_id: String,
                created_at_gte: Time,
                created_at_lte: Time,
                limit: Integer,
                memory_id: String,
                operation:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryVersionOperation::OrSymbol,
                page: String,
                service_account_id: String,
                session_id: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
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
