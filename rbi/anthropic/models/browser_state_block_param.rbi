# typed: strong

module Anthropic
  module Models
    class BrowserStateBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserStateBlockParam, Anthropic::Internal::AnyHash)
        end

      # All tabs open in the browser after this call — the full inventory, not a delta.
      # May be empty. Whenever non-empty, exactly one entry carries `active: true`.
      sig { returns(T::Array[Anthropic::BrowserStateTabEntry]) }
      attr_accessor :tabs

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Tabs opened and download state changes during this call. "Nothing to report" is
      # expressed by omitting the field, never by an empty list.
      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                Anthropic::BrowserStateChangeTabOpened,
                Anthropic::BrowserStateChangeDownloadStarted,
                Anthropic::BrowserStateChangeDownloadCompleted,
                Anthropic::BrowserStateChangeDownloadFailed
              )
            ]
          )
        )
      end
      attr_accessor :state_changes

      # The caller's browser state after a browser toolset member call — the full
      # inventory of open tabs, which tab is active, and any side effects (tabs opened,
      # download state changes) the call produced.
      #
      # At most one per `tool_result`, only on a non-error result answering a browser
      # toolset member `tool_use`. The server renders the model-visible text from it;
      # the model never sees the raw fields.
      sig do
        params(
          tabs: T::Array[Anthropic::BrowserStateTabEntry::OrHash],
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          state_changes:
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::BrowserStateChangeTabOpened::OrHash,
                  Anthropic::BrowserStateChangeDownloadStarted::OrHash,
                  Anthropic::BrowserStateChangeDownloadCompleted::OrHash,
                  Anthropic::BrowserStateChangeDownloadFailed::OrHash
                )
              ]
            ),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # All tabs open in the browser after this call — the full inventory, not a delta.
        # May be empty. Whenever non-empty, exactly one entry carries `active: true`.
        tabs:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Tabs opened and download state changes during this call. "Nothing to report" is
        # expressed by omitting the field, never by an empty list.
        state_changes: nil,
        type: :browser_state
      )
      end

      sig do
        override.returns(
          {
            tabs: T::Array[Anthropic::BrowserStateTabEntry],
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            state_changes:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::BrowserStateChangeTabOpened,
                    Anthropic::BrowserStateChangeDownloadStarted,
                    Anthropic::BrowserStateChangeDownloadCompleted,
                    Anthropic::BrowserStateChangeDownloadFailed
                  )
                ]
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
