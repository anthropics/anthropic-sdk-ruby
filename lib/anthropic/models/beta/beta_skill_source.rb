# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSkillSource < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Where the Skill comes from.
        #
        #   Possible values:
        #
        #   - `"custom"`: authored by the platform user; private to their workspace
        #   - `"anthropic"`: published by Anthropic; shared and read-only
        #   - `"anthropic_example"`: Anthropic-published sample Skill
        #   - `"plugin"`: resolved from an installed plugin
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaSkillSource::Type]
        required :type, enum: -> { Anthropic::Beta::BetaSkillSource::Type }

        # @!method initialize(type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaSkillSource} for more details.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaSkillSource::Type] Where the Skill comes from.

        # Where the Skill comes from.
        #
        # Possible values:
        #
        # - `"custom"`: authored by the platform user; private to their workspace
        # - `"anthropic"`: published by Anthropic; shared and read-only
        # - `"anthropic_example"`: Anthropic-published sample Skill
        # - `"plugin"`: resolved from an installed plugin
        #
        # @see Anthropic::Models::Beta::BetaSkillSource#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CUSTOM = :custom
          ANTHROPIC = :anthropic
          ANTHROPIC_EXAMPLE = :anthropic_example
          PLUGIN = :plugin

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaSkillSource = Beta::BetaSkillSource
  end
end
