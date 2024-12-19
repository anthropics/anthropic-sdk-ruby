# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheControlEphemeral < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaCacheControlEphemeral::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaCacheControlEphemeral::Type }

        # @!parse
        #   # @param type [String]
        #   #
        #   def initialize(type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :ephemeral
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          EPHEMERAL = :ephemeral
        end
      end
    end

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
