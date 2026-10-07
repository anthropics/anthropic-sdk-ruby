# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceAll =
      Beta::BetaManagedAgentsWebFetchURLSourceAll

    module Beta
      class BetaManagedAgentsWebFetchURLSourceAll < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Every URL from this source may be fetched. This is the default.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :all)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
