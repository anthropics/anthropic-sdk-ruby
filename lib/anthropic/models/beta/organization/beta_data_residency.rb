# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidency < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_inference_geos
          #   Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          #   @return [Array<String>, Symbol, :unrestricted]
          required :allowed_inference_geos,
                   union: -> { Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos }

          # @!attribute default_inference_geo
          #   Default inference geo applied when requests omit the parameter.
          #
          #   @return [String]
          required :default_inference_geo, String

          # @!attribute workspace_geo
          #   Geographic region for workspace data storage. Immutable after creation.
          #
          #   @return [String]
          required :workspace_geo, String

          # @!method initialize(allowed_inference_geos:, default_inference_geo:, workspace_geo:)
          #   @param allowed_inference_geos [Array<String>, Symbol, :unrestricted] Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          #   @param default_inference_geo [String] Default inference geo applied when requests omit the parameter.
          #
          #   @param workspace_geo [String] Geographic region for workspace data storage. Immutable after creation.

          # Permitted inference geo values. 'unrestricted' means all geos are allowed.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidency#allowed_inference_geos
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            variant -> { Anthropic::Models::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::StringArray }

            variant const: :unrestricted

            # @!method self.variants
            #   @return [Array(Array<String>, Symbol, :unrestricted)]

            # @type [Anthropic::Internal::Type::Converter]
            StringArray = Anthropic::Internal::Type::ArrayOf[String]
          end
        end
      end
    end
  end
end
