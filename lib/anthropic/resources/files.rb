# frozen_string_literal: true

module Anthropic
  module Resources
    class Files
      # List Files
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileListParams} for more details.
      #
      # @overload list(ids: nil, limit: nil, page: nil, request_options: {})
      #
      # @param ids [Array<String>, nil] Restrict the result set to Files whose `id` is in this list. At most 100 entries
      #
      # @param limit [Integer] Number of items to return per page.
      #
      # @param page [String, nil] Opaque page cursor returned in a prior list response's `next_page`. Prefixed `pa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::PageCursor<Anthropic::Models::FileMetadata>]
      #
      # @see Anthropic::Models::FileListParams
      def list(params = {})
        parsed, options = Anthropic::FileListParams.dump_request(params)
        query = Anthropic::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "v1/files",
          query: query,
          page: Anthropic::Internal::PageCursor,
          model: Anthropic::FileMetadata,
          options: options
        )
      end

      # Delete File
      #
      # @overload delete(file_id, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::DeletedFile]
      #
      # @see Anthropic::Models::FileDeleteParams
      def delete(file_id, params = {})
        @client.request(
          method: :delete,
          path: ["v1/files/%1$s", file_id],
          model: Anthropic::DeletedFile,
          options: params[:request_options]
        )
      end

      # Download File
      #
      # @overload download(file_id, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see Anthropic::Models::FileDownloadParams
      def download(file_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/files/%1$s/content", file_id],
          headers: {"accept" => "application/binary"},
          model: StringIO,
          options: params[:request_options]
        )
      end

      # Get File Metadata
      #
      # @overload retrieve_metadata(file_id, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::FileMetadata]
      #
      # @see Anthropic::Models::FileRetrieveMetadataParams
      def retrieve_metadata(file_id, params = {})
        @client.request(
          method: :get,
          path: ["v1/files/%1$s", file_id],
          model: Anthropic::FileMetadata,
          options: params[:request_options]
        )
      end

      # Upload File
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileUploadParams} for more details.
      #
      # @overload upload(file:, expires_in_seconds: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] The file to upload. Only the final path component of the part's `filename` is ke
      #
      # @param expires_in_seconds [Integer] Seconds from upload until the file expires and its bytes become permanently unav
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::FileMetadata]
      #
      # @see Anthropic::Models::FileUploadParams
      def upload(params)
        parsed, options = Anthropic::FileUploadParams.dump_request(params)
        @client.request(
          method: :post,
          path: "v1/files",
          headers: {"content-type" => "multipart/form-data"},
          body: parsed,
          model: Anthropic::FileMetadata,
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
