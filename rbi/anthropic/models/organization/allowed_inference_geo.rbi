# typed: strong

module Anthropic
  module Models
    module Organization
      module AllowedInferenceGeo
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AllowedInferenceGeo)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        GLOBAL =
          T.let(
            :global,
            Anthropic::Organization::AllowedInferenceGeo::TaggedSymbol
          )
        US =
          T.let(:us, Anthropic::Organization::AllowedInferenceGeo::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Organization::AllowedInferenceGeo::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
