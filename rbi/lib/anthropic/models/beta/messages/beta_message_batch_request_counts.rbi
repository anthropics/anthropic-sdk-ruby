# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchRequestCounts < Anthropic::BaseModel
          sig { returns(Integer) }
          def canceled
          end

          sig { params(_: Integer).returns(Integer) }
          def canceled=(_)
          end

          sig { returns(Integer) }
          def errored
          end

          sig { params(_: Integer).returns(Integer) }
          def errored=(_)
          end

          sig { returns(Integer) }
          def expired
          end

          sig { params(_: Integer).returns(Integer) }
          def expired=(_)
          end

          sig { returns(Integer) }
          def processing
          end

          sig { params(_: Integer).returns(Integer) }
          def processing=(_)
          end

          sig { returns(Integer) }
          def succeeded
          end

          sig { params(_: Integer).returns(Integer) }
          def succeeded=(_)
          end

          sig do
            params(
              canceled: Integer,
              errored: Integer,
              expired: Integer,
              processing: Integer,
              succeeded: Integer
            ).void
          end
          def initialize(canceled:, errored:, expired:, processing:, succeeded:)
          end

          sig do
            override.returns(
              {
                canceled: Integer,
                errored: Integer,
                expired: Integer,
                processing: Integer,
                succeeded: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
