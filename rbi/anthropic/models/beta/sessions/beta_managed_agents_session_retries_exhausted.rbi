# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRetriesExhausted < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The turn ended because repeated errors exhausted the retry budget or an error
          # escalated to `retry_status: 'exhausted'`.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :retries_exhausted)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
