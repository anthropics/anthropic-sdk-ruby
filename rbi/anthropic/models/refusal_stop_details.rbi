# typed: strong

module Anthropic
  module Models
    class RefusalStopDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::RefusalStopDetails, Anthropic::Internal::AnyHash)
        end

      # The policy category that triggered a refusal.
      sig do
        returns(
          T.nilable(Anthropic::RefusalStopDetails::Category::TaggedSymbol)
        )
      end
      attr_accessor :category

      # Human-readable explanation of the refusal.
      #
      # This text is not guaranteed to be stable. `null` when no explanation is
      # available for the category.
      sig { returns(T.nilable(String)) }
      attr_accessor :explanation

      sig { returns(Symbol) }
      attr_accessor :type

      # Structured information about a refusal.
      sig do
        params(
          category:
            T.nilable(Anthropic::RefusalStopDetails::Category::OrSymbol),
          explanation: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The policy category that triggered a refusal.
        category:,
        # Human-readable explanation of the refusal.
        #
        # This text is not guaranteed to be stable. `null` when no explanation is
        # available for the category.
        explanation:,
        type: :refusal
      )
      end

      sig do
        override.returns(
          {
            category:
              T.nilable(Anthropic::RefusalStopDetails::Category::TaggedSymbol),
            explanation: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end

      # The policy category that triggered a refusal.
      module Category
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::RefusalStopDetails::Category)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The request could enable cyber harm, such as malware or exploit development. Benign cybersecurity work can also trigger this category.
        CYBER =
          T.let(:cyber, Anthropic::RefusalStopDetails::Category::TaggedSymbol)

        # The request could enable biological harm, such as dangerous lab methods. Beneficial life sciences work can also trigger this category.
        BIO = T.let(:bio, Anthropic::RefusalStopDetails::Category::TaggedSymbol)

        # The request could assist the development of competing AI models, which is restricted under [Anthropic's commercial terms](https://www.anthropic.com/legal/commercial-terms). Benign machine learning work can also trigger this category.
        FRONTIER_LLM =
          T.let(
            :frontier_llm,
            Anthropic::RefusalStopDetails::Category::TaggedSymbol
          )

        # The request asks the model to reproduce its internal reasoning in the response text. To get reasoning in a structured form instead, use [adaptive thinking](https://platform.claude.com/docs/en/build-with-claude/adaptive-thinking).
        REASONING_EXTRACTION =
          T.let(
            :reasoning_extraction,
            Anthropic::RefusalStopDetails::Category::TaggedSymbol
          )

        # The request could be related to an area that was determined as harmful. Benign work might sometimes trigger this category.
        GENERAL_HARMS =
          T.let(
            :general_harms,
            Anthropic::RefusalStopDetails::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::RefusalStopDetails::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
