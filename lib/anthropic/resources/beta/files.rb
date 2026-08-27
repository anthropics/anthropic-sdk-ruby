# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Files
        # List Files
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::FileListParams} for more details.
        #
        # @overload list(ids: nil, limit: nil, page: nil, scope_id: nil, betas: nil, request_options: {})
        #
        # @param ids [Array<String>, nil] Query param: Restrict the result set to Files whose `id` is in this list. At mos
        #
        # @param limit [Integer] Query param: Number of items to return per page.
        #
        # @param page [String, nil] Query param: Opaque page cursor returned in a prior list response's `next_page`.
        #
        # @param scope_id [String] Query param: Filter by scope ID. Only returns files associated with the specifie
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaFileMetadata>]
        #
        # @see Anthropic::Models::Beta::FileListParams
        def list(params = {})
          query_params = [:ids, :limit, :page, :scope_id]
          parsed, options = Anthropic::Beta::FileListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/files?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaFileMetadata,
            options: options
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
        # @return [Anthropic::Models::Beta::BetaDeletedFile]
        #
        # @see Anthropic::Models::Beta::FileDeleteParams
        def delete(file_id, params = {})
          parsed, options = Anthropic::Beta::FileDeleteParams.dump_request(params)
          @client.request(
            method: :delete,
            path: ["v1/files/%1$s?beta=true", file_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaDeletedFile,
            options: options
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
            options: options
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
        # @return [Anthropic::Models::Beta::BetaFileMetadata]
        #
        # @see Anthropic::Models::Beta::FileRetrieveMetadataParams
        def retrieve_metadata(file_id, params = {})
          parsed, options = Anthropic::Beta::FileRetrieveMetadataParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/files/%1$s?beta=true", file_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaFileMetadata,
            options: options
          )
        end

        # Upload File
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::FileUploadParams} for more details.
        #
        # @overload upload(file:, expires_in_seconds: nil, betas: nil, request_options: {})
        #
        # @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] Body param: The file to upload
        #
        # @param expires_in_seconds [Integer] Body param: Seconds from upload until the file expires and its bytes become perm
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaFileMetadata]
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
            model: Anthropic::Beta::BetaFileMetadata,
            options: options
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
