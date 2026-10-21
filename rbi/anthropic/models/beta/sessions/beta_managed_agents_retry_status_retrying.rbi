# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusRetrying < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusRetrying,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The server is retrying automatically. Client should wait; the same error type
          # may fire again as retrying, then once as exhausted when the retry budget runs
          # out.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :retrying)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
