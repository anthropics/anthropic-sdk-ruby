# typed: strong

module Anthropic
  module Models
    BetaBrowserStateBlockParam = Beta::BetaBrowserStateBlockParam

    module Beta
      class BetaBrowserStateBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserStateBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # All tabs open in the browser after this call — the full inventory, not a delta.
        # May be empty. Whenever non-empty, exactly one entry carries `active: true`.
        sig { returns(T::Array[Anthropic::Beta::BetaBrowserStateTabEntry]) }
        attr_accessor :tabs

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
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
                  Anthropic::Beta::BetaBrowserStateChangeTabOpened,
                  Anthropic::Beta::BetaBrowserStateChangeDownloadStarted,
                  Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted,
                  Anthropic::Beta::BetaBrowserStateChangeDownloadFailed
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
            tabs: T::Array[Anthropic::Beta::BetaBrowserStateTabEntry::OrHash],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            state_changes:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaBrowserStateChangeTabOpened::OrHash,
                    Anthropic::Beta::BetaBrowserStateChangeDownloadStarted::OrHash,
                    Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted::OrHash,
                    Anthropic::Beta::BetaBrowserStateChangeDownloadFailed::OrHash
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
              tabs: T::Array[Anthropic::Beta::BetaBrowserStateTabEntry],
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              state_changes:
                T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaBrowserStateChangeTabOpened,
                      Anthropic::Beta::BetaBrowserStateChangeDownloadStarted,
                      Anthropic::Beta::BetaBrowserStateChangeDownloadCompleted,
                      Anthropic::Beta::BetaBrowserStateChangeDownloadFailed
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
end
