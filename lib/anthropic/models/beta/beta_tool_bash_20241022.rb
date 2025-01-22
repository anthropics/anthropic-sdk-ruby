# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_bash20241022 => {
      #   name: Anthropic::Models::Beta::BetaToolBash20241022::Name,
      #   type: Anthropic::Models::Beta::BetaToolBash20241022::Type,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaToolBash20241022 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #     This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Name]
        required :name, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Name }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param name [String]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   def initialize(name:, type:, cache_control: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        #
        # @example
        # ```ruby
        # case name
        # in :bash
        #   # ...
        # end
        # ```
        class Name < Anthropic::Enum
          BASH = :bash

          finalize!
        end

        # @example
        # ```ruby
        # case type
        # in :bash_20241022
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          BASH_20241022 = :bash_20241022

          finalize!
        end
      end
    end

    BetaToolBash20241022 = Beta::BetaToolBash20241022
  end
end
