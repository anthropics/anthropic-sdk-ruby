# typed: strong

module Anthropic
  module Models
    BetaComputerLeftMouseUpInput = Beta::BetaComputerLeftMouseUpInput

    module Beta
      class BetaComputerLeftMouseUpInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerLeftMouseUpInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Release the left mouse button.
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
