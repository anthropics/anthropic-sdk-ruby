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
          sig { returns(String) }
          attr_accessor :default_inference_geo

          # Geographic region for workspace data storage. Immutable after creation.
          sig { returns(String) }
          attr_accessor :workspace_geo

          sig do
            params(
              allowed_inference_geos: T.any(T::Array[String], Symbol),
              default_inference_geo: String,
              workspace_geo: String
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
                default_inference_geo: String,
                workspace_geo: String
              }
            )
          end
          def to_hash
          end

          # Permitted inference geo values. 'unrestricted' means all geos are allowed.
          module AllowedInferenceGeos
            extend Anthropic::Internal::Type::Union

            Variants = T.type_alias { T.any(T::Array[String], Symbol) }

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaDataResidency::AllowedInferenceGeos::Variants
                ]
              )
            end
            def self.variants
            end

            StringArray =
              T.let(
                Anthropic::Internal::Type::ArrayOf[String],
                Anthropic::Internal::Type::Converter
              )
          end
        end
      end
    end
  end
end
