# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolComputerUse20241022 < Anthropic::BaseModel
        # The height of the display in pixels.
        sig { returns(Integer) }
        attr_accessor :display_height_px

        # The width of the display in pixels.
        sig { returns(Integer) }
        attr_accessor :display_width_px

        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        # The X11 display number (e.g. 0, 1) for the display.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :display_number

        sig do
          params(
            display_height_px: Integer,
            display_width_px: Integer,
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)),
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
          type: :computer_20241022
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

    BetaToolComputerUse20241022 = Beta::BetaToolComputerUse20241022
  end
end
