# typed: strong

module Anthropic
  module Models
    BetaBrowserLeftClickInput = Beta::BetaBrowserLeftClickInput

    module Beta
      class BetaBrowserLeftClickInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserLeftClickInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Where to act: either a viewport coordinate or an element reference.
        sig { returns(Anthropic::Beta::BetaBrowserClickTarget::Variants) }
        attr_accessor :target

        # Optional modifier key chord to hold for the duration of this action (e.g.
        # "shift", "ctrl+shift", "cmd+alt").
        sig { returns(T.nilable(String)) }
        attr_accessor :modifiers

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Left-click at a viewport coordinate or on an element by reference.
        sig do
          params(
            target:
              T.any(
                Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash,
                Anthropic::Beta::BetaBrowserRefTarget::OrHash
              ),
            modifiers: T.nilable(String),
            tab_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Where to act: either a viewport coordinate or an element reference.
          target:,
          # Optional modifier key chord to hold for the duration of this action (e.g.
          # "shift", "ctrl+shift", "cmd+alt").
          modifiers: nil,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig do
          override.returns(
            {
              target: Anthropic::Beta::BetaBrowserClickTarget::Variants,
              modifiers: T.nilable(String),
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
