# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :memory_store_id

          sig { returns(String) }
          attr_accessor :memory_id

          # Query parameter for view
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

          # New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
          # leave the content unchanged (e.g., for a rename-only update).
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # New path for the memory (a rename). Must start with `/`, contain at least one
          # non-empty segment, and be at most 1,024 bytes. Must not contain empty segments,
          # `.` or `..` segments, control or format characters, and must be NFC-normalized.
          # Paths are case-sensitive. The memory's `id` is preserved across renames. Omit to
          # leave the path unchanged.
          sig { returns(T.nilable(String)) }
          attr_accessor :path

          # Optimistic-concurrency precondition: the update applies only if the memory's
          # stored `content_sha256` equals the supplied value. On mismatch, the request
          # returns `memory_precondition_failed_error` (HTTP 409); re-read the memory and
          # retry against the fresh state. If the precondition fails but the stored state
          # already exactly matches the requested `content` and `path`, the server returns
          # 200 instead of 409.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition
              )
            )
          end
          attr_reader :precondition

          sig do
            params(
              precondition:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::OrHash
            ).void
          end
          attr_writer :precondition

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

          sig do
            params(
              memory_store_id: String,
              memory_id: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              content: T.nilable(String),
              path: T.nilable(String),
              precondition:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition::OrHash,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            memory_store_id:,
            memory_id:,
            # Query parameter for view
            view: nil,
            # New UTF-8 text content for the memory. Maximum 100 kB (102,400 bytes). Omit to
            # leave the content unchanged (e.g., for a rename-only update).
            content: nil,
            # New path for the memory (a rename). Must start with `/`, contain at least one
            # non-empty segment, and be at most 1,024 bytes. Must not contain empty segments,
            # `.` or `..` segments, control or format characters, and must be NFC-normalized.
            # Paths are case-sensitive. The memory's `id` is preserved across renames. Omit to
            # leave the path unchanged.
            path: nil,
            # Optimistic-concurrency precondition: the update applies only if the memory's
            # stored `content_sha256` equals the supplied value. On mismatch, the request
            # returns `memory_precondition_failed_error` (HTTP 409); re-read the memory and
            # retry against the fresh state. If the precondition fails but the stored state
            # already exactly matches the requested `content` and `path`, the server returns
            # 200 instead of 409.
            precondition: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                memory_store_id: String,
                memory_id: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
                content: T.nilable(String),
                path: T.nilable(String),
                precondition:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsPrecondition,
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
