# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class DataResidencyCreateConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute allowed_inference_geos
        #   Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
        #   allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
        #   specific geos.
        #
        #   @return [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>, nil]
        optional :allowed_inference_geos,
                 union: -> { Anthropic::Organization::DataResidencyCreateConfig::AllowedInferenceGeos },
                 nil?: true

        # @!attribute default_inference_geo
        #   Default inference geo applied when requests omit the parameter. Defaults to
        #   'global' if omitted. Must be a member of `allowed_inference_geos` unless
        #   `allowed_inference_geos` is `"unrestricted"`.
        #
        #   @return [Symbol, Anthropic::Models::Organization::DataResidencyCreateConfig::DefaultInferenceGeo, nil]
        optional :default_inference_geo,
                 enum: -> { Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo },
                 nil?: true

        # @!attribute workspace_geo
        #   Geographic region for workspace data storage. Immutable after creation. Defaults
        #   to 'us' if omitted.
        #
        #   @return [Symbol, Anthropic::Models::Organization::DataResidencyCreateConfig::WorkspaceGeo, nil]
        optional :workspace_geo,
                 enum: -> { Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo },
                 nil?: true

        # @!method initialize(allowed_inference_geos: nil, default_inference_geo: nil, workspace_geo: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::DataResidencyCreateConfig} for more details.
        #
        #   @param allowed_inference_geos [Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>, nil] Permitted inference geo values. Defaults to 'unrestricted' if omitted, which all
        #
        #   @param default_inference_geo [Symbol, Anthropic::Models::Organization::DataResidencyCreateConfig::DefaultInferenceGeo, nil] Default inference geo applied when requests omit the parameter. Defaults to 'glo
        #
        #   @param workspace_geo [Symbol, Anthropic::Models::Organization::DataResidencyCreateConfig::WorkspaceGeo, nil] Geographic region for workspace data storage. Immutable after creation. Defaults

        # Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
        # allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
        # specific geos.
        #
        # @see Anthropic::Models::Organization::DataResidencyCreateConfig#allowed_inference_geos
        module AllowedInferenceGeos
          extend Anthropic::Internal::Type::Union

          variant const: :unrestricted

          variant -> { Anthropic::Models::Organization::DataResidencyCreateConfig::AllowedInferenceGeos::AllowedInferenceGeoArray }

          # @!method self.variants
          #   @return [Array(Symbol, :unrestricted, Array<Symbol, Anthropic::Models::Organization::AllowedInferenceGeo>)]

          # @type [Anthropic::Internal::Type::Converter]
          AllowedInferenceGeoArray =
            Anthropic::Internal::Type::ArrayOf[enum: -> { Anthropic::Organization::AllowedInferenceGeo }]
        end

        # Default inference geo applied when requests omit the parameter. Defaults to
        # 'global' if omitted. Must be a member of `allowed_inference_geos` unless
        # `allowed_inference_geos` is `"unrestricted"`.
        #
        # @see Anthropic::Models::Organization::DataResidencyCreateConfig#default_inference_geo
        module DefaultInferenceGeo
          extend Anthropic::Internal::Type::Enum

          GLOBAL = :global
          US = :us

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Geographic region for workspace data storage. Immutable after creation. Defaults
        # to 'us' if omitted.
        #
        # @see Anthropic::Models::Organization::DataResidencyCreateConfig#workspace_geo
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
