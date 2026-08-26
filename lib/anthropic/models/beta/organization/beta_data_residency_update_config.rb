# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidencyUpdateConfig < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_inference_geos
          #   Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
          #   of specific geos.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted, nil]
          optional :allowed_inference_geos,
                   union: -> {
                     Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::AllowedInferenceGeos
                   },
                   nil?: true

          # @!attribute default_inference_geo
          #   Default inference geo applied when requests omit the parameter. Must be a member
          #   of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo, nil]
          optional :default_inference_geo,
                   enum: -> {
                     Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo
                   },
                   nil?: true

          # @!method initialize(allowed_inference_geos: nil, default_inference_geo: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig} for more
          #   details.
          #
          #   @param allowed_inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted, nil] Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
          #
          #   @param default_inference_geo [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo, nil] Default inference geo applied when requests omit the parameter. Must be a member

          # Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
          # of specific geos.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig#allowed_inference_geos
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            variant -> { Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig::AllowedInferenceGeos::BetaAllowedInferenceGeoArray }

            variant const: :unrestricted

            # @!method self.variants
            #   @return [Array(Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted)]

            # @type [Anthropic::Internal::Type::Converter]
            BetaAllowedInferenceGeoArray =
              Anthropic::Internal::Type::ArrayOf[enum: -> {
                Anthropic::Beta::Organization::BetaAllowedInferenceGeo
              }]
          end

          # Default inference geo applied when requests omit the parameter. Must be a member
          # of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig#default_inference_geo
          module DefaultInferenceGeo
            extend Anthropic::Internal::Type::Enum

            GLOBAL = :global
            US = :us

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
