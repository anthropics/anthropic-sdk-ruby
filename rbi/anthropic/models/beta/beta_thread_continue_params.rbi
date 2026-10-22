# typed: strong

module Anthropic
  module Models
    BetaThreadContinueParams = Beta::BetaThreadContinueParams

    module Beta
      class BetaThreadContinueParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThreadContinueParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The `id` of the previous response in this Thread.
        sig { returns(String) }
        attr_accessor :previous_message_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Resume from the response named by `previous_message_id`.
        sig do
          params(previous_message_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # The `id` of the previous response in this Thread.
          previous_message_id:,
          type: :continue
        )
        end

        sig { override.returns({ previous_message_id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
