# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserStateChangeDownloadFailed < Anthropic::Internal::Type::BaseModel
        # @!attribute download_id
        #   The caller-assigned identifier for this download, stable across the state
        #   changes reporting it.
        #
        #   @return [String]
        required :download_id, String

        # @!attribute type
        #
        #   @return [Symbol, :download_failed]
        required :type, const: :download_failed

        # @!attribute url
        #   The final post-redirect URL the download was served from.
        #
        #   @return [String]
        required :url, String

        # @!attribute error
        #   The failure or cancellation detail, when known.
        #
        #   @return [String, nil]
        optional :error, String, nil?: true

        # @!method initialize(download_id:, url:, error: nil, type: :download_failed)
        #   A file download that failed — or was cancelled — during this call.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserStateChangeDownloadFailed} for more
        #   details.
        #
        #   @param download_id [String] The caller-assigned identifier for this download, stable across the state change
        #
        #   @param url [String] The final post-redirect URL the download was served from.
        #
        #   @param error [String, nil] The failure or cancellation detail, when known.
        #
        #   @param type [Symbol, :download_failed]
      end
    end

    BetaBrowserStateChangeDownloadFailed = Beta::BetaBrowserStateChangeDownloadFailed
  end
end
