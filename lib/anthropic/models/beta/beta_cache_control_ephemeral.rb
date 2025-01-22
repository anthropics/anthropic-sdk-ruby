# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_cache_control_ephemeral => {
      #   type: Anthropic::Models::Beta::BetaCacheControlEphemeral::Type
      # }
      # ```
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
        # ```ruby
        # case type
        # in :ephemeral
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          EPHEMERAL = :ephemeral

          finalize!
        end
      end
    end

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
