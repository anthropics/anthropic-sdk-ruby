# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileEfsProgram < Anthropic::Internal::Type::BaseModel
      # @!attribute features
      #   The program's features, keyed by feature: `data_retention_exemption` (use of
      #   models that normally require data retention, without the data being retained),
      #   `cmek` (customer-managed encryption keys) and `storage` (customer-owned
      #   storage). Every feature that the caller's organization may read has a key,
      #   whether or not it is approved; a missing key does not mean that the feature is
      #   inactive. Anthropic may add features; ignore a key you do not recognize.
      #
      #   @return [Hash{Symbol=>Anthropic::Models::UserProfileEfsFeature}]
      required :features, -> { Anthropic::Internal::Type::HashOf[Anthropic::UserProfileEfsFeature] }

      # @!attribute status
      #   Anthropic's decision on the entity the profile represents: `pending` while it is
      #   awaited, `active` once Anthropic has approved the entity for the program, or
      #   `rejected` once Anthropic has declined or has removed the entity from the
      #   program. `active` does not mean that any one feature is approved: read the
      #   feature you need in `features`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileProgramStatus]
      required :status, enum: -> { Anthropic::UserProfileProgramStatus }

      # @!method initialize(features:, status:)
      #   A user profile's standing in Enterprise Frontier Safeguards, a program under
      #   which Anthropic approves the entity the profile represents and may approve any
      #   of the program's features.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileEfsProgram} for more details.
      #
      #   @param features [Hash{Symbol=>Anthropic::Models::UserProfileEfsFeature}] The program's features, keyed by feature: `data_retention_exemption` (use of mod
      #
      #   @param status [Symbol, Anthropic::Models::UserProfileProgramStatus] Anthropic's decision on the entity the profile represents: `pending` while it is
    end
  end
end
