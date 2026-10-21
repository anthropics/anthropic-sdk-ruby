# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeltaContent = Beta::BetaManagedAgentsDeltaContent

    module Beta
      class BetaManagedAgentsDeltaContent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeltaContent,
              Anthropic::Internal::AnyHash
            )
          end

        # A partial element of the content array at index, typed like the element itself —
        # the same shape the buffered agent.message carries in content.
        sig { returns(Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock) }
        attr_reader :content

        sig do
          params(
            content:
              Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash
          ).void
        end
        attr_writer :content

        sig { returns(Symbol) }
        attr_accessor :type

        # Which entry in the previewed event's content array this fragment lands in.
        # Insert content as that entry when the index is new; append to the existing entry
        # otherwise.
        sig { returns(T.nilable(Integer)) }
        attr_reader :index

        sig { params(index: Integer).void }
        attr_writer :index

        sig do
          params(
            content:
              Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
            index: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A partial element of the content array at index, typed like the element itself —
          # the same shape the buffered agent.message carries in content.
          content:,
          # Which entry in the previewed event's content array this fragment lands in.
          # Insert content as that entry when the index is new; append to the existing entry
          # otherwise.
          index: nil,
          type: :content_delta
        )
        end

        sig do
          override.returns(
            {
              content: Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
              type: Symbol,
              index: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
