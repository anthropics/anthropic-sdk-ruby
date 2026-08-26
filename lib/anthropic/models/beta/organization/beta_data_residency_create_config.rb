# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidencyCreateConfig < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_inference_geos
          #   Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
          #   allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
          #   specific geos.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted, nil]
          optional :allowed_inference_geos,
                   union: -> {
                     Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::AllowedInferenceGeos
                   },
                   nil?: true

          # @!attribute default_inference_geo
          #   Default inference geo applied when requests omit the parameter. Defaults to
          #   'global' if omitted. Must be a member of `allowed_inference_geos` unless
          #   `allowed_inference_geos` is `"unrestricted"`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig::DefaultInferenceGeo, nil]
          optional :default_inference_geo,
                   enum: -> {
                     Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::DefaultInferenceGeo
                   },
                   nil?: true

          # @!attribute workspace_geo
          #   Geographic region for workspace data storage. Immutable after creation. Defaults
          #   to 'us' if omitted.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig::WorkspaceGeo, nil]
          optional :workspace_geo,
                   enum: -> { Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::WorkspaceGeo },
                   nil?: true

          # @!method initialize(allowed_inference_geos: nil, default_inference_geo: nil, workspace_geo: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig} for more
          #   details.
          #
          #   @param allowed_inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted, nil] Permitted inference geo values. Defaults to 'unrestricted' if omitted, which all
          #
          #   @param default_inference_geo [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig::DefaultInferenceGeo, nil] Default inference geo applied when requests omit the parameter. Defaults to 'glo
          #
          #   @param workspace_geo [Symbol, Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig::WorkspaceGeo, nil] Geographic region for workspace data storage. Immutable after creation. Defaults

          # Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
          # allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
          # specific geos.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig#allowed_inference_geos
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            variant -> { Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig::AllowedInferenceGeos::BetaAllowedInferenceGeoArray }

            variant const: :unrestricted

            # @!method self.variants
            #   @return [Array(Array<Symbol, Anthropic::Models::Beta::Organization::BetaAllowedInferenceGeo>, Symbol, :unrestricted)]

            # @type [Anthropic::Internal::Type::Converter]
            BetaAllowedInferenceGeoArray =
              Anthropic::Internal::Type::ArrayOf[enum: -> {
                Anthropic::Beta::Organization::BetaAllowedInferenceGeo
              }]
          end

          # Default inference geo applied when requests omit the parameter. Defaults to
          # 'global' if omitted. Must be a member of `allowed_inference_geos` unless
          # `allowed_inference_geos` is `"unrestricted"`.
          #
          # @see Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig#default_inference_geo
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
          # @see Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig#workspace_geo
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
