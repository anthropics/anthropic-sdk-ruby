# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class DataResidency < Anthropic::Internal::Type::BaseModel
        # @!attribute allowed_inference_geos
        #   Permitted inference geo values. 'unrestricted' means all geos are allowed.
        #
        #   @return [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>]
        required :allowed_inference_geos,
                 union: -> { Anthropic::Organization::DataResidency::AllowedInferenceGeos }

        # @!attribute default_inference_geo
        #   Default inference geo applied when requests omit the parameter.
        #
        #   @return [Symbol, Anthropic::Models::Organization::DataResidency::DefaultInferenceGeo]
        required :default_inference_geo, enum: -> { Anthropic::Organization::DataResidency::DefaultInferenceGeo }

        # @!attribute workspace_geo
        #   Geographic region for workspace data storage. Immutable after creation.
        #
        #   @return [Symbol, Anthropic::Models::Organization::DataResidency::WorkspaceGeo]
        required :workspace_geo, enum: -> { Anthropic::Organization::DataResidency::WorkspaceGeo }

        # @!method initialize(allowed_inference_geos:, default_inference_geo:, workspace_geo:)
        #   @param allowed_inference_geos [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>] Permitted inference geo values. 'unrestricted' means all geos are allowed.
        #
        #   @param default_inference_geo [Symbol, Anthropic::Models::Organization::DataResidency::DefaultInferenceGeo] Default inference geo applied when requests omit the parameter.
        #
        #   @param workspace_geo [Symbol, Anthropic::Models::Organization::DataResidency::WorkspaceGeo] Geographic region for workspace data storage. Immutable after creation.

        # Permitted inference geo values. 'unrestricted' means all geos are allowed.
        #
        # @see Anthropic::Models::Organization::DataResidency#allowed_inference_geos
        module AllowedInferenceGeos
          extend Anthropic::Internal::Type::Union

          variant const: :unrestricted

          variant -> { Anthropic::Models::Organization::DataResidency::AllowedInferenceGeos::AllowedInferenceGeoArray }

          # @!method self.variants
          #   @return [Array(Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>)]

          # @type [Anthropic::Internal::Type::Converter]
          AllowedInferenceGeoArray =
            Anthropic::Internal::Type::ArrayOf[enum: -> { Anthropic::Organization::AllowedInferenceGeo }]
        end

        # Default inference geo applied when requests omit the parameter.
        #
        # @see Anthropic::Models::Organization::DataResidency#default_inference_geo
        module DefaultInferenceGeo
          extend Anthropic::Internal::Type::Enum

          GLOBAL = :global
          US = :us

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Geographic region for workspace data storage. Immutable after creation.
        #
        # @see Anthropic::Models::Organization::DataResidency#workspace_geo
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
