# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserDoubleClickConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute defer_loading
        #   Defer loading for this member. Must resolve to the same value on every enabled
        #   member of the toolset.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute enabled
        #   Whether this member is offered to the model. Default is per member, per the
        #   toolset's documentation. A member whose enabled resolves false is withheld from
        #   the served schema.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!method initialize(defer_loading: nil, enabled: nil)
        #   `double_click`'s config overrides.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserDoubleClickConfig} for more details.
        #
        #   @param defer_loading [Boolean, nil] Defer loading for this member. Must resolve to the same value on every enabled m
        #
        #   @param enabled [Boolean, nil] Whether this member is offered to the model. Default is per member, per the tool
      end
    end

    BetaBrowserDoubleClickConfig = Beta::BetaBrowserDoubleClickConfig
  end
end
