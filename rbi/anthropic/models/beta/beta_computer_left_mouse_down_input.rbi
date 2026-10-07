# typed: strong

module Anthropic
  module Models
    BetaComputerLeftMouseDownInput = Beta::BetaComputerLeftMouseDownInput

    module Beta
      class BetaComputerLeftMouseDownInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerLeftMouseDownInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Press and hold the left mouse button at the current cursor position.
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
