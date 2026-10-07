# typed: strong

module Anthropic
  module Models
    class BrowserHoverInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserHoverInput, Anthropic::Internal::AnyHash)
        end

      # Where to act: either a viewport coordinate or an element reference.
      sig { returns(Anthropic::BrowserClickTarget::Variants) }
      attr_accessor :target

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Move the cursor to a coordinate or element without clicking.
      sig do
        params(
          target:
            T.any(
              Anthropic::BrowserCoordinateTarget::OrHash,
              Anthropic::BrowserRefTarget::OrHash
            ),
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Where to act: either a viewport coordinate or an element reference.
        target:,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            target: Anthropic::BrowserClickTarget::Variants,
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
