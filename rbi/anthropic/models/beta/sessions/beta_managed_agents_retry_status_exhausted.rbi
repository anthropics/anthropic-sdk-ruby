# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusExhausted < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # This turn is dead; queued inputs are flushed and the session returns to idle.
          # Client may send a new prompt.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :exhausted)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
