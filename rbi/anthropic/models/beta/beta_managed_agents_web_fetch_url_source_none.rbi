# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceNone =
      Beta::BetaManagedAgentsWebFetchURLSourceNone

    module Beta
      class BetaManagedAgentsWebFetchURLSourceNone < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # This source contributes no URLs that may be fetched.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :none)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
