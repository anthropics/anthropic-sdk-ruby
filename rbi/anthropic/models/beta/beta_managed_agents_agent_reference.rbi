# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentReference = Beta::BetaManagedAgentsAgentReference

    module Beta
      class BetaManagedAgentsAgentReference < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentReference,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :version

        # A resolved agent reference with a concrete version.
        sig do
          params(id: String, version: Integer, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(id:, version:, type: :agent)
        end

        sig { override.returns({ id: String, type: Symbol, version: Integer }) }
        def to_hash
        end
      end
    end
  end
end
