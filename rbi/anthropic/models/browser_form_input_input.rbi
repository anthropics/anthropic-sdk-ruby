# typed: strong

module Anthropic
  module Models
    class BrowserFormInputInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserFormInputInput, Anthropic::Internal::AnyHash)
        end

      # An element on the page, identified by a reference from a prior `read_page` or
      # `find` result. References are scoped to the tab that produced them and become
      # stale after navigation or a major re-render.
      sig { returns(Anthropic::BrowserRefTarget) }
      attr_reader :target

      sig { params(target: Anthropic::BrowserRefTarget::OrHash).void }
      attr_writer :target

      # The value to set.
      sig { returns(Anthropic::BrowserFormInputValue::Variants) }
      attr_accessor :value

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Set the value of a form element (input, textarea, select, checkbox). Use a
      # boolean for checkboxes, an option value or text for selects.
      sig do
        params(
          target: Anthropic::BrowserRefTarget::OrHash,
          value: Anthropic::BrowserFormInputValue::Variants,
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # An element on the page, identified by a reference from a prior `read_page` or
        # `find` result. References are scoped to the tab that produced them and become
        # stale after navigation or a major re-render.
        target:,
        # The value to set.
        value:,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            target: Anthropic::BrowserRefTarget,
            value: Anthropic::BrowserFormInputValue::Variants,
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
