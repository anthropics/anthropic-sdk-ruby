# typed: strong

module Anthropic
  module Models
    BetaBrowserScrollToInput = Beta::BetaBrowserScrollToInput

    module Beta
      class BetaBrowserScrollToInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserScrollToInput,
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

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Scroll an element into view.
        sig do
          params(
            target: Anthropic::Beta::BetaBrowserRefTarget::OrHash,
            tab_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # An element on the page, identified by a reference from a prior `read_page` or
          # `find` result. References are scoped to the tab that produced them and become
          # stale after navigation or a major re-render.
          target:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig do
          override.returns(
            {
              target: Anthropic::Beta::BetaBrowserRefTarget,
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
