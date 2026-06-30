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

        # Regular text content.
        sig { returns(Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock) }
        attr_reader :content

        sig do
          params(
            content:
              Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash
          ).void
        end
        attr_writer :content

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeltaContent::Type::TaggedSymbol
          )
        end
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
            type:
              Anthropic::Beta::BetaManagedAgentsDeltaContent::Type::OrSymbol,
            index: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Regular text content.
          content:,
          type:,
          # Which entry in the previewed event's content array this fragment lands in.
          # Insert content as that entry when the index is new; append to the existing entry
          # otherwise.
          index: nil
        )
        end

        sig do
          override.returns(
            {
              content: Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock,
              type:
                Anthropic::Beta::BetaManagedAgentsDeltaContent::Type::TaggedSymbol,
              index: Integer
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeltaContent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CONTENT_DELTA =
            T.let(
              :content_delta,
              Anthropic::Beta::BetaManagedAgentsDeltaContent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeltaContent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
