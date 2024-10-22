# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolComputerUse20241022 < BaseModel
      # @!attribute [rw] display_height_px
      #   @return [Integer]
      required :display_height_px, Integer

      # @!attribute [rw] display_width_px
      #   @return [Integer]
      required :display_width_px, Integer

      # @!attribute [rw] name_
      #   @return [Symbol, Anthropic::Models::BetaToolComputerUse20241022::Name]
      required :name_, api_name: :name, enum: -> { Anthropic::Models::BetaToolComputerUse20241022::Name }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolComputerUse20241022::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolComputerUse20241022::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      # @!attribute [rw] display_number
      #   @return [Integer]
      optional :display_number, Integer

      class Name < Anthropic::Enum
        COMPUTER = :computer
      end

      class Type < Anthropic::Enum
        COMPUTER_20241022 = :computer_20241022
      end

      # @!parse
      #   # Create a new instance of BetaToolComputerUse20241022 from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :display_height_px
      #   #   @option data [Integer] :display_width_px
      #   #   @option data [String] :name
      #   #   @option data [String] :type
      #   #   @option data [Object, nil] :cache_control
      #   #   @option data [Integer, nil] :display_number
      #   def initialize(data = {}) = super
    end
  end
end
