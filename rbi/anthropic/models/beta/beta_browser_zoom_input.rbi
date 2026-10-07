# typed: strong

module Anthropic
  module Models
    BetaBrowserZoomInput = Beta::BetaBrowserZoomInput

    module Beta
      class BetaBrowserZoomInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserZoomInput,
              Anthropic::Internal::AnyHash
            )
          end

        # [x0, y0, x1, y1] in viewport pixels.
        sig { returns(T::Array[Integer]) }
        attr_accessor :region

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Return a cropped screenshot of the given viewport region, scaled up for closer
        # inspection — useful for small icons, buttons, or text. Coordinates are in the
        # same viewport-pixel space as a full screenshot.
        sig do
          params(region: T::Array[Integer], tab_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # [x0, y0, x1, y1] in viewport pixels.
          region:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig do
          override.returns(
            { region: T::Array[Integer], tab_id: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
