# typed: strong

module Anthropic
  module Models
    BetaBrowserNewTabInput = Beta::BetaBrowserNewTabInput

    module Beta
      class BetaBrowserNewTabInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserNewTabInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Open a new empty tab and return its tab_id.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
