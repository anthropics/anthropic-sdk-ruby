# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchRequestCounts < Anthropic::BaseModel
          Shape = T.type_alias do
            {canceled: Integer, errored: Integer, expired: Integer, processing: Integer, succeeded: Integer}
          end

          sig { returns(Integer) }
          attr_accessor :canceled

          sig { returns(Integer) }
          attr_accessor :errored

          sig { returns(Integer) }
          attr_accessor :expired

          sig { returns(Integer) }
          attr_accessor :processing

          sig { returns(Integer) }
          attr_accessor :succeeded

          sig do
            params(
              canceled: Integer,
              errored: Integer,
              expired: Integer,
              processing: Integer,
              succeeded: Integer
            ).void
          end
          def initialize(canceled:, errored:, expired:, processing:, succeeded:); end

          sig { returns(Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts::Shape) }
          def to_h; end
        end
      end
    end
  end
end
