# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortXhigh = Beta::BetaManagedAgentsEffortXhigh

    module Beta
      class BetaManagedAgentsEffortXhigh < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortXhigh,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Extra-high effort. Not all models accept this level.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :xhigh)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
