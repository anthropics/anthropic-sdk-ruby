# typed: strong

module Anthropic
  module Models
    BetaBrowserFormInputInput = Beta::BetaBrowserFormInputInput

    module Beta
      class BetaBrowserFormInputInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserFormInputInput,
              Anthropic::Internal::AnyHash
            )
          end

        # An element on the page, identified by a reference from a prior `read_page` or
        # `find` result. References are scoped to the tab that produced them and become
        # stale after navigation or a major re-render.
        sig { returns(Anthropic::Beta::BetaBrowserRefTarget) }
        attr_reader :target

        sig do
          params(target: Anthropic::Beta::BetaBrowserRefTarget::OrHash).void
        end
        attr_writer :target

        # The value to set.
        sig { returns(Anthropic::Beta::BetaBrowserFormInputValue::Variants) }
        attr_accessor :value

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Set the value of a form element (input, textarea, select, checkbox). Use a
        # boolean for checkboxes, an option value or text for selects.
        sig do
          params(
            target: Anthropic::Beta::BetaBrowserRefTarget::OrHash,
            value: Anthropic::Beta::BetaBrowserFormInputValue::Variants,
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
              target: Anthropic::Beta::BetaBrowserRefTarget,
              value: Anthropic::Beta::BetaBrowserFormInputValue::Variants,
              tab_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
