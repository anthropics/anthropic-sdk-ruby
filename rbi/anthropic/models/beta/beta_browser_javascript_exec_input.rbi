# typed: strong

module Anthropic
  module Models
    BetaBrowserJavascriptExecInput = Beta::BetaBrowserJavascriptExecInput

    module Beta
      class BetaBrowserJavascriptExecInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserJavascriptExecInput,
              Anthropic::Internal::AnyHash
            )
          end

        # JavaScript to execute in the page context.
        sig { returns(String) }
        attr_accessor :text

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Execute JavaScript in the page context and return the value of the last
        # expression. The code runs with access to the DOM, `window`, and page variables.
        # Write the expression you want evaluated — do NOT use `return`.
        sig do
          params(text: String, tab_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # JavaScript to execute in the page context.
          text:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ text: String, tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
