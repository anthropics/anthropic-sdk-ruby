# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class MemoryListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::MemoryListParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :memory_store_id

          # `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1`
          # returns immediate children only; deeper entries roll up as `memory_prefix`
          # items. `depth=1` behaves like `ls`; omitting `depth` behaves like `find`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :depth

          sig { params(depth: Integer).void }
          attr_writer :depth

          # Maximum number of items to return per page. Must be between 1 and 100. Defaults
          # to 20 when omitted. Capped at 20 when `view=full`. Both `memory` and
          # `memory_prefix` items count toward the limit.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Query parameter for order
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::OrSymbol
              )
            )
          end
          attr_reader :order

          sig do
            params(
              order:
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::OrSymbol
            ).void
          end
          attr_writer :order

          # Query parameter for order_by
          sig { returns(T.nilable(String)) }
          attr_reader :order_by

          sig { params(order_by: String).void }
          attr_writer :order_by

          # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
          # previous response to fetch the next page; omit for the first page.
          sig { returns(T.nilable(String)) }
          attr_reader :page

          sig { params(page: String).void }
          attr_writer :page

          # Optional path prefix filter. Must end with `/` (segment-aligned), e.g.,
          # `/notes/`. This value appears in request URLs. Do not include secrets or
          # personally identifiable information.
          sig { returns(T.nilable(String)) }
          attr_reader :path_prefix

          sig { params(path_prefix: String).void }
          attr_writer :path_prefix

          # Which projection of each `memory` to return. Defaults to `basic` (content
          # omitted). `full` populates `content` on each item and caps `limit` at 20; use
          # this as the bulk-read path for export and sync.
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
              depth: Integer,
              limit: Integer,
              order:
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::OrSymbol,
              order_by: String,
              page: String,
              path_prefix: String,
              view:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryView::OrSymbol,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            memory_store_id:,
            # `0` (or omitted) returns all descendants below `path_prefix` (recursive). `1`
            # returns immediate children only; deeper entries roll up as `memory_prefix`
            # items. `depth=1` behaves like `ls`; omitting `depth` behaves like `find`.
            depth: nil,
            # Maximum number of items to return per page. Must be between 1 and 100. Defaults
            # to 20 when omitted. Capped at 20 when `view=full`. Both `memory` and
            # `memory_prefix` items count toward the limit.
            limit: nil,
            # Query parameter for order
            order: nil,
            # Query parameter for order_by
            order_by: nil,
            # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
            # previous response to fetch the next page; omit for the first page.
            page: nil,
            # Optional path prefix filter. Must end with `/` (segment-aligned), e.g.,
            # `/notes/`. This value appears in request URLs. Do not include secrets or
            # personally identifiable information.
            path_prefix: nil,
            # Which projection of each `memory` to return. Defaults to `basic` (content
            # omitted). `full` populates `content` on each item and caps `limit` at 20; use
            # this as the bulk-read path for export and sync.
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
                depth: Integer,
                limit: Integer,
                order:
                  Anthropic::Beta::MemoryStores::MemoryListParams::Order::OrSymbol,
                order_by: String,
                page: String,
                path_prefix: String,
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

          # Query parameter for order
          module Order
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::MemoryListParams::Order
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ASC =
              T.let(
                :asc,
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::TaggedSymbol
              )
            DESC =
              T.let(
                :desc,
                Anthropic::Beta::MemoryStores::MemoryListParams::Order::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::MemoryListParams::Order::TaggedSymbol
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
