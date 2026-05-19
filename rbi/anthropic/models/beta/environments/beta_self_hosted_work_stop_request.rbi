# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkStopRequest < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWorkStopRequest,
                Anthropic::Internal::AnyHash
              )
            end

          # If true, immediately stop work without graceful shutdown
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :force

          sig { params(force: T::Boolean).void }
          attr_writer :force

          # Request to stop a work item.
          sig { params(force: T::Boolean).returns(T.attached_class) }
          def self.new(
            # If true, immediately stop work without graceful shutdown
            force: nil
          )
          end

          sig { override.returns({ force: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
