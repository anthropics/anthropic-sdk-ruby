# typed: strong

module Anthropic
  module Models
    BetaToolComputerUse20250124 = T.type_alias { Beta::BetaToolComputerUse20250124 }

    module Beta
      class BetaToolComputerUse20250124 < Anthropic::BaseModel
        # The height of the display in pixels.
        sig { returns(Integer) }
        def display_height_px
        end

        sig { params(_: Integer).returns(Integer) }
        def display_height_px=(_)
        end

        # The width of the display in pixels.
        sig { returns(Integer) }
        def display_width_px
        end

        sig { params(_: Integer).returns(Integer) }
        def display_width_px=(_)
        end

        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        sig { returns(Symbol) }
        def name
        end

        sig { params(_: Symbol).returns(Symbol) }
        def name=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

        # The X11 display number (e.g. 0, 1) for the display.
        sig { returns(T.nilable(Integer)) }
        def display_number
        end

        sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def display_number=(_)
        end

        sig do
          params(
            display_height_px: Integer,
            display_width_px: Integer,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            display_number: T.nilable(Integer),
            name: Symbol,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(
          display_height_px:,
          display_width_px:,
          cache_control: nil,
          display_number: nil,
          name: :computer,
          type: :computer_20250124
        )
        end

        sig do
          override
            .returns(
              {
                display_height_px: Integer,
                display_width_px: Integer,
                name: Symbol,
                type: Symbol,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
                display_number: T.nilable(Integer)
              }
            )
        end
        def to_hash
        end
      end
    end
  end
end
