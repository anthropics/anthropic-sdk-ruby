# typed: strong

module Anthropic
  module Models
    BetaBrowserStateChangeDownloadCompleted =
      Beta::BetaBrowserStateChangeDownloadCompleted

    module Beta
      class BetaBrowserStateChangeDownloadCompleted < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted,
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

        # Where the executor saved the file, on the executor's filesystem. Only included
        # when another tool in the same environment can read the file at that path.
        sig { returns(T.nilable(String)) }
        attr_accessor :path

        # The completed download's size.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :size_bytes

        # A file download that finished during this call, reported with the same
        # `download_id` as its `download_started` — or without a prior `download_started`,
        # when the download finished during the call that started it (at most one state
        # change per `download_id` per result).
        sig do
          params(
            download_id: String,
            url: String,
            path: T.nilable(String),
            size_bytes: T.nilable(Integer),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The caller-assigned identifier for this download, stable across the state
          # changes reporting it.
          download_id:,
          # The final post-redirect URL the download was served from.
          url:,
          # Where the executor saved the file, on the executor's filesystem. Only included
          # when another tool in the same environment can read the file at that path.
          path: nil,
          # The completed download's size.
          size_bytes: nil,
          type: :download_completed
        )
        end

        sig do
          override.returns(
            {
              download_id: String,
              type: Symbol,
              url: String,
              path: T.nilable(String),
              size_bytes: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
