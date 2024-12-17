# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaCacheControlEphemeral < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral::Type
                   }

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type:) = super

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

      PromptCachingBetaCacheControlEphemeral = PromptCaching::PromptCachingBetaCacheControlEphemeral
    end
  end
end
