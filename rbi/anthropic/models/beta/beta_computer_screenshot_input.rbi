# typed: strong

module Anthropic
  module Models
    BetaComputerScreenshotInput = Beta::BetaComputerScreenshotInput

    module Beta
      class BetaComputerScreenshotInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerScreenshotInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Take a screenshot of the screen.
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
