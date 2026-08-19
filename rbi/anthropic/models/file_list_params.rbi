# typed: strong

module Anthropic
  module Models
    class FileListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::FileListParams, Anthropic::Internal::AnyHash)
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

      sig do
        params(
          ids: T.nilable(T::Array[String]),
          limit: Integer,
          page: T.nilable(String),
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
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            ids: T.nilable(T::Array[String]),
            limit: Integer,
            page: T.nilable(String),
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
