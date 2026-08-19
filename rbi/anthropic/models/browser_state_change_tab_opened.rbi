# typed: strong

module Anthropic
  module Models
    class BrowserStateChangeTabOpened < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserStateChangeTabOpened,
            Anthropic::Internal::AnyHash
          )
        end

      # The `tab_id` of the opened tab, present in `tabs`.
      sig { returns(String) }
      attr_accessor :tab_id

      sig { returns(Symbol) }
      attr_accessor :type

      # A tab this call's execution opened that remains open at its end — the creation
      # delta of the `tabs` inventory, not an event log.
      #
      # Carries only the `tab_id`; the tab's `title` and `url` live on its `tabs` entry,
      # which must include the same `tab_id`. A tab opened during a failed call gets no
      # deferred `tab_opened`; it simply appears in the next result's `tabs` inventory.
      sig { params(tab_id: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # The `tab_id` of the opened tab, present in `tabs`.
        tab_id:,
        type: :tab_opened
      )
      end

      sig { override.returns({ tab_id: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
