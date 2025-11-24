# typed: strong

module Anthropic
  module Models
    BetaToolReferenceBlock = Beta::BetaToolReferenceBlock

    module Beta
      class BetaToolReferenceBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolReferenceBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :tool_name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(tool_name: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(tool_name:, type: :tool_reference)
        end

        sig { override.returns({ tool_name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
