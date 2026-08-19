# typed: strong

module Anthropic
  module Models
    class BrowserStateChangeDownloadFailed < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserStateChangeDownloadFailed,
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

      # The failure or cancellation detail, when known.
      sig { returns(T.nilable(String)) }
      attr_accessor :error

      # A file download that failed — or was cancelled — during this call.
      sig do
        params(
          download_id: String,
          url: String,
          error: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The caller-assigned identifier for this download, stable across the state
        # changes reporting it.
        download_id:,
        # The final post-redirect URL the download was served from.
        url:,
        # The failure or cancellation detail, when known.
        error: nil,
        type: :download_failed
      )
      end

      sig do
        override.returns(
          {
            download_id: String,
            type: Symbol,
            url: String,
            error: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
