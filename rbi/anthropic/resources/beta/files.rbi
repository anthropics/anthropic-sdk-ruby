# typed: strong

module Anthropic
  module Resources
    class Beta
      class Files
        # List Files
        sig do
          params(
            ids: T.nilable(T::Array[String]),
            limit: Integer,
            page: T.nilable(String),
            scope_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::PageCursor[Anthropic::Beta::BetaFileMetadata]
          )
        end
        def list(
          # Query param: Restrict the result set to Files whose `id` is in this list. At
          # most 100 entries (after de-duplication). Mutually exclusive with `page` and
          # `limit`. When supplied, the response is always a single page (`next_page` is
          # null). IDs that do not resolve to a visible File — including deleted Files — are
          # silently omitted.
          ids: nil,
          # Query param: Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          # Query param: Opaque page cursor returned in a prior list response's `next_page`.
          # Prefixed `page_`.
          page: nil,
          # Query param: Filter by scope ID. Only returns files associated with the
          # specified scope (e.g., a session ID).
          scope_id: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Delete File
        sig do
          params(
            file_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaDeletedFile)
        end
        def delete(
          # ID of the File.
          file_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Download File
        sig do
          params(
            file_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(StringIO)
        end
        def download(
          # ID of the File.
          file_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Get File Metadata
        sig do
          params(
            file_id: String,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaFileMetadata)
        end
        def retrieve_metadata(
          # ID of the File.
          file_id,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # Upload File
        sig do
          params(
            file: Anthropic::Internal::FileInput,
            expires_in_seconds: Integer,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaFileMetadata)
        end
        def upload(
          # Body param: The file to upload. Only the final path component of the part's
          # `filename` is kept; an absent or empty `filename` is replaced with `unnamed`
          # plus the extension for the file's stored `mime_type`, when known.
          file:,
          # Body param: Seconds from upload until the file expires and its bytes become
          # permanently unavailable. Must be between 3600 (one hour) and 7776000 (ninety
          # days).
          expires_in_seconds: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
