# typed: strong

module Anthropic
  module Models
    class BrowserStateChangeDownloadStarted < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserStateChangeDownloadStarted,
            Anthropic::Internal::AnyHash
          )
        end

      # The caller-assigned identifier for this download, stable across the state
      # changes reporting it.
      sig { returns(String) }
      attr_accessor :download_id

      sig { returns(Symbol) }
      attr_accessor :type

      # The final post-redirect URL the download was served from.
      sig { returns(String) }
      attr_accessor :url

      # A file download that started during this call.
      sig do
        params(download_id: String, url: String, type: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # The caller-assigned identifier for this download, stable across the state
        # changes reporting it.
        download_id:,
        # The final post-redirect URL the download was served from.
        url:,
        type: :download_started
      )
      end

      sig do
        override.returns({ download_id: String, type: Symbol, url: String })
      end
      def to_hash
      end
    end
  end
end
