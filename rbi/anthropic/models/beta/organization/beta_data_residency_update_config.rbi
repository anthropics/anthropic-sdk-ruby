# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDataResidencyUpdateConfig < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig,
                Anthropic::Internal::AnyHash
              )
            end

          # Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
          # of specific geos.
          sig do
            returns(
              T.nilable(
                T.any(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAllowedInferenceGeo::OrSymbol
                  ],
                  Symbol
                )
              )
            )
          end
          attr_accessor :allowed_inference_geos

          # Default inference geo applied when requests omit the parameter. Must be a member
          # of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::OrSymbol
              )
            )
          end
          attr_accessor :default_inference_geo

          sig do
            params(
              allowed_inference_geos:
                T.nilable(
                  T.any(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAllowedInferenceGeo::OrSymbol
                    ],
                    Symbol
                  )
                ),
              default_inference_geo:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
            # of specific geos.
            allowed_inference_geos: nil,
            # Default inference geo applied when requests omit the parameter. Must be a member
            # of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
            default_inference_geo: nil
          )
          end

          sig do
            override.returns(
              {
                allowed_inference_geos:
                  T.nilable(
                    T.any(
                      T::Array[
                        Anthropic::Beta::Organization::BetaAllowedInferenceGeo::OrSymbol
                      ],
                      Symbol
                    )
                  ),
                default_inference_geo:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::OrSymbol
                  )
              }
            )
          end
          def to_hash
          end

          # Permitted inference geo values. Use 'unrestricted' to allow all geos, or a list
          # of specific geos.
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAllowedInferenceGeo::TaggedSymbol
                  ],
                  Symbol
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::AllowedInferenceGeos::Variants
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

          # Default inference geo applied when requests omit the parameter. Must be a member
          # of `allowed_inference_geos` unless `allowed_inference_geos` is `"unrestricted"`.
          module DefaultInferenceGeo
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::TaggedSymbol
              )
            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::DefaultInferenceGeo::TaggedSymbol
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
