# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileEfsFeature < Anthropic::Internal::Type::BaseModel
      # @!attribute status
      #   `active` when Anthropic has approved the entity the profile represents to use
      #   the feature, otherwise `inactive`. `active` does not mean that the feature is
      #   set up or switched on, which is a separate step.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileEfsFeature::Status]
      required :status, enum: -> { Anthropic::UserProfileEfsFeature::Status }

      # @!method initialize(status:)
      #   One feature of Enterprise Frontier Safeguards.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileEfsFeature} for more details.
      #
      #   @param status [Symbol, Anthropic::Models::UserProfileEfsFeature::Status] `active` when Anthropic has approved the entity the profile represents to use th

      # `active` when Anthropic has approved the entity the profile represents to use
      # the feature, otherwise `inactive`. `active` does not mean that the feature is
      # set up or switched on, which is a separate step.
      #
      # @see Anthropic::Models::UserProfileEfsFeature#status
      module Status
        extend Anthropic::Internal::Type::Enum

        ACTIVE = :active
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
