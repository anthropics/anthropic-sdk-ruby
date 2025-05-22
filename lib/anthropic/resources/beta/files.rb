# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Files
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::FileListParams} for more details.
        #
        # List Files
        #
        # @overload list(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {})
        #
        # @param after_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param before_id [String] Query param: ID of the object to use as a cursor for pagination. When provided,
        #
        # @param limit [Integer] Query param: Number of items to return per page.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::FileMetadata>]
        #
        # @see Anthropic::Models::Beta::FileListParams
        def list(params = {})
          parsed, options = Anthropic::Beta::FileListParams.dump_request(params)
          query_params = [:after_id, :before_id, :limit]
          @client.request(
            method: :get,
            path: "v1/files?beta=true",
            query: parsed.slice(*query_params),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::Page,
            model: Anthropic::Beta::FileMetadata,
            options: {extra_headers: {"anthropic-beta" => "files-api-2025-04-14"}, **options}
          )
        end

        # Delete File
        #
        # @overload delete(file_id, betas: nil, request_options: {})
        #
        # @param file_id [String] ID of the File.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::DeletedFile]
        #
        # @see Anthropic::Models::Beta::FileDeleteParams
        def delete(file_id, params = {})
          parsed, options = Anthropic::Beta::FileDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/files/%1$s?beta=true", file_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::DeletedFile,
            options: {extra_headers: {"anthropic-beta" => "files-api-2025-04-14"}, **options}
          )
        end

        # Download File
        #
        # @overload download(file_id, betas: nil, request_options: {})
        #
        # @param file_id [String] ID of the File.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [StringIO]
        #
        # @see Anthropic::Models::Beta::FileDownloadParams
        def download(file_id, params = {})
          parsed, options = Anthropic::Beta::FileDownloadParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/files/%1$s/content?beta=true", file_id],
            headers: {"accept" => "application/binary", **parsed}.transform_keys(betas: "anthropic-beta"),
            model: StringIO,
            options: {extra_headers: {"anthropic-beta" => "files-api-2025-04-14"}, **options}
          )
        end

        # Get File Metadata
        #
        # @overload retrieve_metadata(file_id, betas: nil, request_options: {})
        #
        # @param file_id [String] ID of the File.
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::FileMetadata]
        #
        # @see Anthropic::Models::Beta::FileRetrieveMetadataParams
        def retrieve_metadata(file_id, params = {})
          parsed, options = Anthropic::Beta::FileRetrieveMetadataParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/files/%1$s?beta=true", file_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::FileMetadata,
            options: {extra_headers: {"anthropic-beta" => "files-api-2025-04-14"}, **options}
          )
        end

        # Upload File
        #
        # @overload upload(file:, betas: nil, request_options: {})
        #
        # @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] Body param: The file to upload
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::FileMetadata]
        #
        # @see Anthropic::Models::Beta::FileUploadParams
        def upload(params)
          parsed, options = Anthropic::Beta::FileUploadParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/files?beta=true",
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::FileMetadata,
            options: {extra_headers: {"anthropic-beta" => "files-api-2025-04-14"}, **options}
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
