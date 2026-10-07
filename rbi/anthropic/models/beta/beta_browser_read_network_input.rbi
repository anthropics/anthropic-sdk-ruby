# typed: strong

module Anthropic
  module Models
    BetaBrowserReadNetworkInput = Beta::BetaBrowserReadNetworkInput

    module Beta
      class BetaBrowserReadNetworkInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserReadNetworkInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Return the network requests (method, URL, status, MIME type, timing) recorded
        # since the driver attached to the tab and since the last read, one line per
        # entry. An empty result does not mean no traffic for a tab that predates attach.
        sig { params(tab_id: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
