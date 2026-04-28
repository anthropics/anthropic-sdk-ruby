# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :memory_store_id

          # UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
          # pass `""` explicitly to create an empty memory.
          sig { returns(T.nilable(String)) }
          attr_accessor :content

          # Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
          # with `/`, contain at least one non-empty segment, and be at most 1,024 bytes.
          # Must not contain empty segments, `.` or `..` segments, control or format
          # characters, and must be NFC-normalized. Paths are case-sensitive.
          sig { returns(String) }
          attr_accessor :path

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
              content: T.nilable(String),
              path: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            memory_store_id:,
            # UTF-8 text content for the new memory. Maximum 100 kB (102,400 bytes). Required;
            # pass `""` explicitly to create an empty memory.
            content:,
            # Hierarchical path for the new memory, e.g. `/projects/foo/notes.md`. Must start
            # with `/`, contain at least one non-empty segment, and be at most 1,024 bytes.
            # Must not contain empty segments, `.` or `..` segments, control or format
            # characters, and must be NFC-normalized. Paths are case-sensitive.
            path:,
            # Query parameter for view
            view: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                memory_store_id: String,
                content: T.nilable(String),
                path: String,
                view:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
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
