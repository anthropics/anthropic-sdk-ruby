# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRefusalStopDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails,
                Anthropic::Internal::AnyHash
              )
            end

          # The policy category that triggered the refusal, or `null` when there is no named
          # category. New values can be added over time.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )
            )
          end
          attr_accessor :category

          # Human-readable explanation of the refusal, or `null` when none is available. The
          # wording can change, so do not parse it.
          sig { returns(T.nilable(String)) }
          attr_accessor :explanation

          sig { returns(Symbol) }
          attr_accessor :type

          # Structured information about a refusal.
          sig do
            params(
              category:
                T.nilable(
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::OrSymbol
                ),
              explanation: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The policy category that triggered the refusal, or `null` when there is no named
            # category. New values can be added over time.
            category:,
            # Human-readable explanation of the refusal, or `null` when none is available. The
            # wording can change, so do not parse it.
            explanation:,
            type: :refusal
          )
          end

          sig do
            override.returns(
              {
                category:
                  T.nilable(
                    Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
                  ),
                explanation: T.nilable(String),
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # The policy category that triggered the refusal, or `null` when there is no named
          # category. New values can be added over time.
          module Category
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CYBER =
              T.let(
                :cyber,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )
            BIO =
              T.let(
                :bio,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )
            FRONTIER_LLM =
              T.let(
                :frontier_llm,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )
            REASONING_EXTRACTION =
              T.let(
                :reasoning_extraction,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )
            GENERAL_HARMS =
              T.let(
                :general_harms,
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category::TaggedSymbol
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
end
