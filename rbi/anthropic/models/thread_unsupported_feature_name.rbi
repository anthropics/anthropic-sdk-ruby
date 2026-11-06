# typed: strong

module Anthropic
  module Models
    module ThreadUnsupportedFeatureName
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::ThreadUnsupportedFeatureName) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      CACHE_CONTROL =
        T.let(
          :cache_control,
          Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol
        )
      CONTEXT_MANAGEMENT =
        T.let(
          :context_management,
          Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol
        )
      FALLBACKS =
        T.let(:fallbacks, Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol)
      HIPAA =
        T.let(:hipaa, Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol)
      INFERENCE_HOOKS =
        T.let(
          :inference_hooks,
          Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol
        )
      THINKING =
        T.let(:thinking, Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
