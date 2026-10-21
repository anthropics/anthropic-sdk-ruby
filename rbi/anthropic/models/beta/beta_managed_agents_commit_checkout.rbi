# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCommitCheckout = Beta::BetaManagedAgentsCommitCheckout

    module Beta
      class BetaManagedAgentsCommitCheckout < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCommitCheckout,
              Anthropic::Internal::AnyHash
            )
          end

        # Full commit SHA to check out.
        sig { returns(String) }
        attr_accessor :sha

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(sha: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Full commit SHA to check out.
          sha:,
          type: :commit
        )
        end

        sig { override.returns({ sha: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
