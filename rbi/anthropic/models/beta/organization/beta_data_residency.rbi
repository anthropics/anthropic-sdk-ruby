# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidency < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDataResidency,
                Anthropic::Internal::AnyHash
              )
            end

          # Permitted inference geo values. 'unrestricted' means all geos are allowed.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::Variants
            )
          end
          attr_accessor :allowed_inference_geos

          # Default inference geo applied when requests omit the parameter.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::TaggedSymbol
            )
          end
          attr_accessor :default_inference_geo

          # Geographic region for workspace data storage. Immutable after creation.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo::TaggedSymbol
            )
          end
          attr_accessor :workspace_geo

          sig do
            params(
              allowed_inference_geos:
                T.any(
                  Symbol,
                  T::Array[
                    Anthropic::Beta::Organization::BetaAllowedInferenceGeo::OrSymbol
                  ]
                ),
              default_inference_geo:
                Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::OrSymbol,
              workspace_geo:
                Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Permitted inference geo values. 'unrestricted' means all geos are allowed.
            allowed_inference_geos:,
            # Default inference geo applied when requests omit the parameter.
            default_inference_geo:,
            # Geographic region for workspace data storage. Immutable after creation.
            workspace_geo:
          )
          end

          sig do
            override.returns(
              {
                allowed_inference_geos:
                  Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::Variants,
                default_inference_geo:
                  Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::TaggedSymbol,
                workspace_geo:
                  Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Permitted inference geo values. 'unrestricted' means all geos are allowed.
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Symbol,
                  T::Array[
                    Anthropic::Beta::Organization::BetaAllowedInferenceGeo::TaggedSymbol
                  ]
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::Variants
                ]
              )
            end
            def self.variants
            end

            BetaAllowedInferenceGeoArray =
              T.let(
                Anthropic::Internal::Type::ArrayOf[
                  enum: Anthropic::Beta::Organization::BetaAllowedInferenceGeo
                ],
                Anthropic::Internal::Type::Converter
              )
          end

          # Default inference geo applied when requests omit the parameter.
          module DefaultInferenceGeo
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::TaggedSymbol
              )
            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidency::DefaultInferenceGeo::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Geographic region for workspace data storage. Immutable after creation.
          module WorkspaceGeo
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidency::WorkspaceGeo::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
