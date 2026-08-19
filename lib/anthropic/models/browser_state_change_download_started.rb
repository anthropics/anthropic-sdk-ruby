# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserStateChangeDownloadStarted < Anthropic::Internal::Type::BaseModel
      # @!attribute download_id
      #   The caller-assigned identifier for this download, stable across the state
      #   changes reporting it.
      #
      #   @return [String]
      required :download_id, String

      # @!attribute type
      #
      #   @return [Symbol, :download_started]
      required :type, const: :download_started

      # @!attribute url
      #   The final post-redirect URL the download was served from.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(download_id:, url:, type: :download_started)
      #   A file download that started during this call.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserStateChangeDownloadStarted} for more details.
      #
      #   @param download_id [String] The caller-assigned identifier for this download, stable across the state change
      #
      #   @param url [String] The final post-redirect URL the download was served from.
      #
      #   @param type [Symbol, :download_started]
    end
  end
end
