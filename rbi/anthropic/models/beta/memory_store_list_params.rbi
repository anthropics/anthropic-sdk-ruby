# typed: strong

module Anthropic
  module Models
    module Beta
      class MemoryStoreListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MemoryStoreListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Return only stores whose `created_at` is at or after this time (inclusive). Sent
        # on the wire as `created_at[gte]`.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_gte

        sig { params(created_at_gte: Time).void }
        attr_writer :created_at_gte

        # Return only stores whose `created_at` is at or before this time (inclusive).
        # Sent on the wire as `created_at[lte]`.
        sig { returns(T.nilable(Time)) }
        attr_reader :created_at_lte

        sig { params(created_at_lte: Time).void }
        attr_writer :created_at_lte

        # When `true`, archived stores are included in the results. Defaults to `false`
        # (archived stores are excluded).
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Maximum number of stores to return per page. Must be between 1 and 100. Defaults
        # to 20 when omitted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
        # previous response to fetch the next page; omit for the first page.
        sig { returns(T.nilable(String)) }
        attr_reader :page

        sig { params(page: String).void }
        attr_writer :page

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
            created_at_gte: Time,
            created_at_lte: Time,
            include_archived: T::Boolean,
            limit: Integer,
            page: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Return only stores whose `created_at` is at or after this time (inclusive). Sent
          # on the wire as `created_at[gte]`.
          created_at_gte: nil,
          # Return only stores whose `created_at` is at or before this time (inclusive).
          # Sent on the wire as `created_at[lte]`.
          created_at_lte: nil,
          # When `true`, archived stores are included in the results. Defaults to `false`
          # (archived stores are excluded).
          include_archived: nil,
          # Maximum number of stores to return per page. Must be between 1 and 100. Defaults
          # to 20 when omitted.
          limit: nil,
          # Opaque pagination cursor (a `page_...` value). Pass the `next_page` value from a
          # previous response to fetch the next page; omit for the first page.
          page: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              created_at_gte: Time,
              created_at_lte: Time,
              include_archived: T::Boolean,
              limit: Integer,
              page: String,
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
