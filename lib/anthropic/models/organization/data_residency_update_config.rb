# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class DataResidencyUpdateConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute allowed_inference_geos
        #   Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
        #   of specific geos.
        #
        #   @return [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>, nil]
        optional :allowed_inference_geos,
                 union: -> { Anthropic::Organization::DataResidencyUpdateConfig::AllowedInferenceGeos },
                 nil?: true

        # @!attribute default_inference_geo
        #   Default inference geo applied when requests omit the parameter. Must be a member
        #   of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
        #
        #   @return [Symbol, Anthropic::Models::Organization::DataResidencyUpdateConfig::DefaultInferenceGeo, nil]
        optional :default_inference_geo,
                 enum: -> { Anthropic::Organization::DataResidencyUpdateConfig::DefaultInferenceGeo },
                 nil?: true

        # @!method initialize(allowed_inference_geos: nil, default_inference_geo: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::DataResidencyUpdateConfig} for more details.
        #
        #   @param allowed_inference_geos [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>, nil] Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
        #
        #   @param default_inference_geo [Symbol, Anthropic::Models::Organization::DataResidencyUpdateConfig::DefaultInferenceGeo, nil] Default inference geo applied when requests omit the parameter. Must be a member

        # Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
        # of specific geos.
        #
        # @see Anthropic::Models::Organization::DataResidencyUpdateConfig#allowed_inference_geos
        module AllowedInferenceGeos
          extend Anthropic::Internal::Type::Union

          variant const: :unrestricted

          variant -> { Anthropic::Models::Organization::DataResidencyUpdateConfig::AllowedInferenceGeos::AllowedInferenceGeoArray }

          # @!method self.variants
          #   @return [Array(Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>)]

          # @type [Anthropic::Internal::Type::Converter]
          AllowedInferenceGeoArray =
            Anthropic::Internal::Type::ArrayOf[enum: -> { Anthropic::Organization::AllowedInferenceGeo }]
        end

        # Default inference geo applied when requests omit the parameter. Must be a member
        # of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
        #
        # @see Anthropic::Models::Organization::DataResidencyUpdateConfig#default_inference_geo
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
