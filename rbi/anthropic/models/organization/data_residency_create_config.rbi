# typed: strong

module Anthropic
  module Models
    module Organization
      class DataResidencyCreateConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::DataResidencyCreateConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
        # allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
        # specific geos.
        sig do
          returns(
            T.nilable(
              T.any(
                Symbol,
                T::Array[Anthropic::Organization::AllowedInferenceGeo::OrSymbol]
              )
            )
          )
        end
        attr_accessor :allowed_inference_geos

        # Default inference geo applied when requests omit the parameter. Defaults to
        # 'global' if omitted. Must be a member of `allowed_inference_geos` unless
        # `allowed_inference_geos` is `"unrestricted"`.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::OrSymbol
            )
          )
        end
        attr_accessor :default_inference_geo

        # Geographic region for workspace data storage. Immutable after creation. Defaults
        # to 'us' if omitted.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo::OrSymbol
            )
          )
        end
        attr_accessor :workspace_geo

        sig do
          params(
            allowed_inference_geos:
              T.nilable(
                T.any(
                  Symbol,
                  T::Array[
                    Anthropic::Organization::AllowedInferenceGeo::OrSymbol
                  ]
                )
              ),
            default_inference_geo:
              T.nilable(
                Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::OrSymbol
              ),
            workspace_geo:
              T.nilable(
                Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
          # allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
          # specific geos.
          allowed_inference_geos: nil,
          # Default inference geo applied when requests omit the parameter. Defaults to
          # 'global' if omitted. Must be a member of `allowed_inference_geos` unless
          # `allowed_inference_geos` is `"unrestricted"`.
          default_inference_geo: nil,
          # Geographic region for workspace data storage. Immutable after creation. Defaults
          # to 'us' if omitted.
          workspace_geo: nil
        )
        end

        sig do
          override.returns(
            {
              allowed_inference_geos:
                T.nilable(
                  T.any(
                    Symbol,
                    T::Array[
                      Anthropic::Organization::AllowedInferenceGeo::OrSymbol
                    ]
                  )
                ),
              default_inference_geo:
                T.nilable(
                  Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::OrSymbol
                ),
              workspace_geo:
                T.nilable(
                  Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo::OrSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Permitted inference geo values. Defaults to 'unrestricted' if omitted, which
        # allows all geos. Use the string 'unrestricted' to allow all geos, or a list of
        # specific geos.
        module AllowedInferenceGeos
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Symbol,
                T::Array[
                  Anthropic::Organization::AllowedInferenceGeo::TaggedSymbol
                ]
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::DataResidencyCreateConfig::AllowedInferenceGeos::Variants
              ]
            )
          end
          def self.variants
          end

          AllowedInferenceGeoArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                enum: Anthropic::Organization::AllowedInferenceGeo
              ],
              Anthropic::Internal::Type::Converter
            )
        end

        # Default inference geo applied when requests omit the parameter. Defaults to
        # 'global' if omitted. Must be a member of `allowed_inference_geos` unless
        # `allowed_inference_geos` is `"unrestricted"`.
        module DefaultInferenceGeo
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GLOBAL =
            T.let(
              :global,
              Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::TaggedSymbol
            )
          US =
            T.let(
              :us,
              Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::DataResidencyCreateConfig::DefaultInferenceGeo::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Geographic region for workspace data storage. Immutable after creation. Defaults
        # to 'us' if omitted.
        module WorkspaceGeo
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          US =
            T.let(
              :us,
              Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::DataResidencyCreateConfig::WorkspaceGeo::TaggedSymbol
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
