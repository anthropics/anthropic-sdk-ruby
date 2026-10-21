# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsBranchCheckout = Beta::BetaManagedAgentsBranchCheckout

    module Beta
      class BetaManagedAgentsBranchCheckout < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsBranchCheckout,
              Anthropic::Internal::AnyHash
            )
          end

        # Branch name to check out.
        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(name: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Branch name to check out.
          name:,
          type: :branch
        )
        end

        sig { override.returns({ name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
