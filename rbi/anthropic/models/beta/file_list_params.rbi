# typed: strong

module Anthropic
  module Models
    module Beta
      class FileListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::FileListParams, Anthropic::Internal::AnyHash)
          end

        # Restrict the result set to Files whose `id` is in this list. At most 100 entries
        # (after de-duplication). Mutually exclusive with `page` and `limit`. When
        # supplied, the response is always a single page (`next_page` is null). IDs that
        # do not resolve to a visible File — including deleted Files — are silently
        # omitted.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :ids

        # Number of items to return per page.
        #
        # Defaults to `20`. Ranges from `1` to `1000`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        # Opaque page cursor returned in a prior list response's `next_page`. Prefixed
        # `page_`.
        sig { returns(T.nilable(String)) }
        attr_accessor :page

        # Filter by scope ID. Only returns files associated with the specified scope
        # (e.g., a session ID).
        sig { returns(T.nilable(String)) }
        attr_reader :scope_id

        sig { params(scope_id: String).void }
        attr_writer :scope_id

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
            ids: T.nilable(T::Array[String]),
            limit: Integer,
            page: T.nilable(String),
            scope_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Restrict the result set to Files whose `id` is in this list. At most 100 entries
          # (after de-duplication). Mutually exclusive with `page` and `limit`. When
          # supplied, the response is always a single page (`next_page` is null). IDs that
          # do not resolve to a visible File — including deleted Files — are silently
          # omitted.
          ids: nil,
          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          # Opaque page cursor returned in a prior list response's `next_page`. Prefixed
          # `page_`.
          page: nil,
          # Filter by scope ID. Only returns files associated with the specified scope
          # (e.g., a session ID).
          scope_id: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              ids: T.nilable(T::Array[String]),
              limit: Integer,
              page: T.nilable(String),
              scope_id: String,
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
