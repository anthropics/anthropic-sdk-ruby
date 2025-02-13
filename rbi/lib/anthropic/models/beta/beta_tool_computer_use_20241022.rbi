# typed: strong

module Anthropic
  module Models
    BetaToolComputerUse20241022 = T.type_alias { Beta::BetaToolComputerUse20241022 }

    module Beta
      class BetaToolComputerUse20241022 < Anthropic::BaseModel
        sig { returns(Integer) }
        def display_height_px
        end

        sig { params(_: Integer).returns(Integer) }
        def display_height_px=(_)
        end

        sig { returns(Integer) }
        def display_width_px
        end

        sig { params(_: Integer).returns(Integer) }
        def display_width_px=(_)
        end

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
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)).returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

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
          ).void
        end
        def initialize(
          display_height_px:,
          display_width_px:,
          cache_control: nil,
          display_number: nil,
          name: :computer,
          type: :computer_20241022
        )
        end

        sig do
          override.returns(
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
