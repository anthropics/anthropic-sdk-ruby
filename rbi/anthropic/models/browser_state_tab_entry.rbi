# typed: strong

module Anthropic
  module Models
    class BrowserStateTabEntry < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserStateTabEntry, Anthropic::Internal::AnyHash)
        end

      # The caller-assigned identifier for this tab, unique within the inventory.
      sig { returns(String) }
      attr_accessor :tab_id

      # The title of the page the tab is showing. May be empty.
      sig { returns(String) }
      attr_accessor :title

      # The URL of the page the tab is showing. May be empty.
      sig { returns(String) }
      attr_accessor :url

      # Whether this tab is the active tab after this call. Whenever `tabs` is
      # non-empty, exactly one entry is marked `active: true`.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :active

      sig { params(active: T::Boolean).void }
      attr_writer :active

      # One open browser tab reported in a `browser_state` block's `tabs` inventory.
      #
      # `tab_id` is the caller-assigned identifier for the tab; `title` and `url`
      # describe the page the tab is currently showing and may be empty strings (a blank
      # tab legitimately has both empty). `active` marks the tab that is active after
      # this call; whenever `tabs` is non-empty, exactly one entry is marked.
      sig do
        params(
          tab_id: String,
          title: String,
          url: String,
          active: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The caller-assigned identifier for this tab, unique within the inventory.
        tab_id:,
        # The title of the page the tab is showing. May be empty.
        title:,
        # The URL of the page the tab is showing. May be empty.
        url:,
        # Whether this tab is the active tab after this call. Whenever `tabs` is
        # non-empty, exactly one entry is marked `active: true`.
        active: nil
      )
      end

      sig do
        override.returns(
          { tab_id: String, title: String, url: String, active: T::Boolean }
        )
      end
      def to_hash
      end
    end
  end
end
