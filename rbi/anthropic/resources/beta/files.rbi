# typed: strong

module Anthropic
  module Resources
    class Beta
      class Files
        # List Files
        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Internal::Page[Anthropic::Beta::FileMetadata])
        end
        def list(
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          # returns the page of results immediately after this object.
          after_id: nil,
          # Query param: ID of the object to use as a cursor for pagination. When provided,
          # returns the page of results immediately before this object.
          before_id: nil,
          # Query param: Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
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
          ).returns(Anthropic::Beta::DeletedFile)
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
          ).returns(Anthropic::Beta::FileMetadata)
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
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::FileMetadata)
        end
        def upload(
          # Body param: The file to upload
          file:,
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
