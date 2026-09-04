# frozen_string_literal: true

module Anthropic
  module Resources
    class Files
      # List Files
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileListParams} for more details.
      #
      # @overload list(ids: nil, limit: nil, page: nil, workspace_id: nil, request_options: {})
      #
      # @param ids [Array<String>, nil] Query param: Restrict the result set to Files whose `id` is in this list. At mos
      #
      # @param limit [Integer] Query param: Number of items to return per page.
      #
      # @param page [String, nil] Query param: Opaque page cursor returned in a prior list response's `next_page`.
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::PageCursor<Anthropic::Models::FileMetadata>]
      #
      # @see Anthropic::Models::FileListParams
      def list(params = {})
        query_params = [:ids, :limit, :page]
        parsed, options = Anthropic::FileListParams.dump_request(params)
        query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          method: :get,
          path: "v1/files",
          query: query,
          headers: parsed.except(*query_params).transform_keys(workspace_id: "anthropic-workspace-id"),
          page: Anthropic::Internal::PageCursor,
          model: Anthropic::FileMetadata,
          options: options
        )
      end

      # Delete File
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileDeleteParams} for more details.
      #
      # @overload delete(file_id, workspace_id: nil, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::DeletedFile]
      #
      # @see Anthropic::Models::FileDeleteParams
      def delete(file_id, params = {})
        parsed, options = Anthropic::FileDeleteParams.dump_request(params)
        @client.request(
          method: :delete,
          path: ["v1/files/%1$s", file_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::DeletedFile,
          options: options
        )
      end

      # Download File
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileDownloadParams} for more details.
      #
      # @overload download(file_id, workspace_id: nil, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StringIO]
      #
      # @see Anthropic::Models::FileDownloadParams
      def download(file_id, params = {})
        parsed, options = Anthropic::FileDownloadParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/files/%1$s/content", file_id],
          headers: {
            "accept" => "application/binary",
            **parsed
          }.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: StringIO,
          options: options
        )
      end

      # Get File Metadata
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileRetrieveMetadataParams} for more details.
      #
      # @overload retrieve_metadata(file_id, workspace_id: nil, request_options: {})
      #
      # @param file_id [String] ID of the File.
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::FileMetadata]
      #
      # @see Anthropic::Models::FileRetrieveMetadataParams
      def retrieve_metadata(file_id, params = {})
        parsed, options = Anthropic::FileRetrieveMetadataParams.dump_request(params)
        @client.request(
          method: :get,
          path: ["v1/files/%1$s", file_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::FileMetadata,
          options: options
        )
      end

      # Upload File
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::FileUploadParams} for more details.
      #
      # @overload upload(file:, expires_in_seconds: nil, workspace_id: nil, request_options: {})
      #
      # @param file [Pathname, StringIO, IO, String, Anthropic::FilePart] Body param: The file to upload. Only the final path component of the part's `fil
      #
      # @param expires_in_seconds [Integer] Body param: Seconds from upload until the file expires and its bytes become perm
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::FileMetadata]
      #
      # @see Anthropic::Models::FileUploadParams
      def upload(params)
        parsed, options = Anthropic::FileUploadParams.dump_request(params)
        header_params = {workspace_id: "anthropic-workspace-id"}
        @client.request(
          method: :post,
          path: "v1/files",
          headers: {
            "content-type" => "multipart/form-data",
            **parsed.slice(*header_params.keys)
          }.transform_keys(
            header_params
          ),
          body: parsed.except(*header_params.keys),
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
