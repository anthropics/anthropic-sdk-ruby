# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserStateChangeDownloadCompleted < Anthropic::Internal::Type::BaseModel
        # @!attribute download_id
        #   The caller-assigned identifier for this download, stable across the state
        #   changes reporting it.
        #
        #   @return [String]
        required :download_id, String

        # @!attribute type
        #
        #   @return [Symbol, :download_completed]
        required :type, const: :download_completed

        # @!attribute url
        #   The final post-redirect URL the download was served from.
        #
        #   @return [String]
        required :url, String

        # @!attribute path
        #   Where the executor saved the file, on the executor's filesystem. Only included
        #   when another tool in the same environment can read the file at that path.
        #
        #   @return [String, nil]
        optional :path, String, nil?: true

        # @!attribute size_bytes
        #   The completed download's size.
        #
        #   @return [Integer, nil]
        optional :size_bytes, Integer, nil?: true

        # @!method initialize(download_id:, url:, path: nil, size_bytes: nil, type: :download_completed)
        #   A file download that finished during this call, reported with the same
        #   `download_id` as its `download_started` — or without a prior `download_started`,
        #   when the download finished during the call that started it (at most one state
        #   change per `download_id` per result).
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserStateChangeDownloadCompleted} for more
        #   details.
        #
        #   @param download_id [String] The caller-assigned identifier for this download, stable across the state change
        #
        #   @param url [String] The final post-redirect URL the download was served from.
        #
        #   @param path [String, nil] Where the executor saved the file, on the executor's filesystem. Only included w
        #
        #   @param size_bytes [Integer, nil] The completed download's size.
        #
        #   @param type [Symbol, :download_completed]
      end
    end

    BetaBrowserStateChangeDownloadCompleted = Beta::BetaBrowserStateChangeDownloadCompleted
  end
end
