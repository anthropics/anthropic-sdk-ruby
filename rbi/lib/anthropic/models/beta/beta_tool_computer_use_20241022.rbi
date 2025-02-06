# typed: strong

module Anthropic
  module Models
    BetaToolComputerUse20241022 = T.type_alias { Beta::BetaToolComputerUse20241022 }

    module Beta
      class BetaToolComputerUse20241022 < Anthropic::BaseModel
        sig { returns(Integer) }
        attr_accessor :display_height_px

        sig { returns(Integer) }
        attr_accessor :display_width_px

        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig { returns(T.nilable(Integer)) }
        attr_accessor :display_number

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
        ); end

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
        def to_hash; end
      end
    end
  end
end
