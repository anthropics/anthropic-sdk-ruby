# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::BaseModel
      # @!attribute [r] enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Anthropic::BooleanModel

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :enabled

      # @!parse
      #   # @param enabled [Boolean]
      #   #
      #   def initialize(enabled: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
