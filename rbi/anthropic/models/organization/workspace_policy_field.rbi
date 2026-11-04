# typed: strong

module Anthropic
  module Models
    module Organization
      module WorkspacePolicyField
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::WorkspacePolicyField)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXTERNAL_KEY_ID =
          T.let(
            :external_key_id,
            Anthropic::Organization::WorkspacePolicyField::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::WorkspacePolicyField::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
