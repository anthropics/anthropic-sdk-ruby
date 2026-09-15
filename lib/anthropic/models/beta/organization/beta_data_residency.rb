# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidency < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_inference_geos
          #   Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          #   @return [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>]
          required :allowed_inference_geos,
                   union: -> { Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos }

          # @!attribute default_inference_geo
          #   Default inference geo applied when requests omit the parameter.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidency::DefaultInferenceGeo]
          required :default_inference_geo,
                   enum: -> { Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo }

          # @!attribute workspace_geo
          #   Geographic region for workspace data storage. Immutable after creation.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidency::WorkspaceGeo]
          required :workspace_geo, enum: -> { Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo }

          # @!method initialize(allowed_inference_geos:, default_inference_geo:, workspace_geo:)
          #   @param allowed_inference_geos [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>] Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          #   @param default_inference_geo [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidency::DefaultInferenceGeo] Default inference geo applied when requests omit the parameter.
          #
          #   @param workspace_geo [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidency::WorkspaceGeo] Geographic region for workspace data storage. Immutable after creation.

          # Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidency#allowed_inference_geos
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            variant const: :unrestricted

            variant -> { Anthropic::Models::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::BetaAllowedInferenceGeoArray }

            # @!method self.variants
            #   @return [Array(Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>)]

            # @type [Anthropic::Internal::Type::Converter]
            BetaAllowedInferenceGeoArray =
              Anthropic::Internal::Type::ArrayOf[enum: -> {
                Anthropic::Beta::Organization::BetaAllowedInferenceGeo
              }]
          end

          # Default inference geo applied when requests omit the parameter.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidency#default_inference_geo
          module DefaultInferenceGeo
            extend Anthropic::Internal::Type::Enum

            GLOBAL = :global
            US = :us

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Geographic region for workspace data storage. Immutable after creation.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidency#workspace_geo
          module WorkspaceGeo
            extend Anthropic::Internal::Type::Enum

            US = :us

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
