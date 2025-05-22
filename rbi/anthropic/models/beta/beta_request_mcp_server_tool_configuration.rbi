# typed: strong

module Anthropic
  module Models
    BetaRequestMCPServerToolConfiguration =
      Beta::BetaRequestMCPServerToolConfiguration

    module Beta
      class BetaRequestMCPServerToolConfiguration < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRequestMCPServerToolConfiguration,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_tools

        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :enabled

        sig do
          params(
            allowed_tools: T.nilable(T::Array[String]),
            enabled: T.nilable(T::Boolean)
          ).returns(T.attached_class)
        end
        def self.new(allowed_tools: nil, enabled: nil)
        end

        sig do
          override.returns(
            {
              allowed_tools: T.nilable(T::Array[String]),
              enabled: T.nilable(T::Boolean)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
