# frozen_string_literal: true

module Anthropic
  module Models
    # A tab this call's execution opened that remains open at its end — the creation
    # delta of the `tabs` inventory, not an event log.
    #
    # Carries only the `tab_id`; the tab's `title` and `url` live on its `tabs` entry,
    # which must include the same `tab_id`. A tab opened during a failed call gets no
    # deferred `tab_opened`; it simply appears in the next result's `tabs` inventory.
    module BrowserStateChange
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # A tab this call's execution opened that remains open at its end —
      # the creation delta of the `tabs` inventory, not an event log.
      #
      # Carries only the `tab_id`; the tab's `title` and `url` live on its
      # `tabs` entry, which must include the same `tab_id`. A tab opened
      # during a failed call gets no deferred `tab_opened`; it simply appears
      # in the next result's `tabs` inventory.
      variant :tab_opened, -> { Anthropic::BrowserStateChangeTabOpened }

      # A file download that started during this call.
      variant :download_started, -> { Anthropic::BrowserStateChangeDownloadStarted }

      # A file download that finished during this call, reported with the
      # same `download_id` as its `download_started` — or without a prior
      # `download_started`, when the download finished during the call that
      # started it (at most one state change per `download_id` per result).
      variant :download_completed, -> { Anthropic::BrowserStateChangeDownloadCompleted }

      # A file download that failed — or was cancelled — during this call.
      variant :download_failed, -> { Anthropic::BrowserStateChangeDownloadFailed }

      module Type
        extend Anthropic::Internal::Type::Enum

        TAB_OPENED = :tab_opened
        DOWNLOAD_STARTED = :download_started
        DOWNLOAD_COMPLETED = :download_completed
        DOWNLOAD_FAILED = :download_failed

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @!method self.variants
      #   @return [Array(Anthropic::Models::BrowserStateChangeTabOpened, Anthropic::Models::BrowserStateChangeDownloadStarted, Anthropic::Models::BrowserStateChangeDownloadCompleted, Anthropic::Models::BrowserStateChangeDownloadFailed)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::BrowserStateChange} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :tab_id The `tab_id` of the opened tab, present in `tabs`.
      #
      #   @option args [String] :download_id The caller-assigned identifier for this download, stable across the state change
      #
      #   @option args [String] :url The final post-redirect URL the download was served from.
      #
      #   @option args [String, nil] :path Where the executor saved the file, on the executor's filesystem. Only included w
      #
      #   @option args [Integer, nil] :size_bytes The completed download's size.
      #
      #   @option args [String, nil] :error The failure or cancellation detail, when known.
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::BrowserStateChangeTabOpened, Anthropic::Models::BrowserStateChangeDownloadStarted, Anthropic::Models::BrowserStateChangeDownloadCompleted, Anthropic::Models::BrowserStateChangeDownloadFailed]
      def self.new(type:, **args)
        case type.to_sym
        when :tab_opened
          Anthropic::BrowserStateChangeTabOpened.new(**args)
        when :download_started
          Anthropic::BrowserStateChangeDownloadStarted.new(**args)
        when :download_completed
          Anthropic::BrowserStateChangeDownloadCompleted.new(**args)
        when :download_failed
          Anthropic::BrowserStateChangeDownloadFailed.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
