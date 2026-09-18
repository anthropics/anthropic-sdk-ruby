# typed: strong

module Anthropic
  module Models
    BetaBrowserStateChange = Beta::BetaBrowserStateChange

    module Beta
      module BetaBrowserStateChange
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserStateChangeTabOpened,
              Anthropic::Beta::BetaBrowserStateChangeDownloadStarted,
              Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted,
              Anthropic::Beta::BetaBrowserStateChangeDownloadFailed
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaBrowserStateChange::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TAB_OPENED =
            T.let(
              :tab_opened,
              Anthropic::Beta::BetaBrowserStateChange::Type::TaggedSymbol
            )
          DOWNLOAD_STARTED =
            T.let(
              :download_started,
              Anthropic::Beta::BetaBrowserStateChange::Type::TaggedSymbol
            )
          DOWNLOAD_COMPLETED =
            T.let(
              :download_completed,
              Anthropic::Beta::BetaBrowserStateChange::Type::TaggedSymbol
            )
          DOWNLOAD_FAILED =
            T.let(
              :download_failed,
              Anthropic::Beta::BetaBrowserStateChange::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBrowserStateChange::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaBrowserStateChange::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaBrowserStateChange::Type::OrSymbol,
            tab_id: String,
            download_id: String,
            url: String,
            path: T.nilable(String),
            size_bytes: T.nilable(Integer),
            error: T.nilable(String)
          ).returns(Anthropic::Beta::BetaBrowserStateChange::Variants)
        end
        def self.new(
          type:,
          # The `tab_id` of the opened tab, present in `tabs`.
          tab_id: nil,
          # The caller-assigned identifier for this download, stable across the state
          # changes reporting it.
          download_id: nil,
          # The final post-redirect URL the download was served from.
          url: nil,
          # Where the executor saved the file, on the executor's filesystem. Only included
          # when another tool in the same environment can read the file at that path.
          path: nil,
          # The completed download's size.
          size_bytes: nil,
          # The failure or cancellation detail, when known.
          error: nil
        )
        end
      end
    end
  end
end
