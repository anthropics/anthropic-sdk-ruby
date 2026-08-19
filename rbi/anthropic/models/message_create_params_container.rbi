# typed: strong

module Anthropic
  module Models
    # Container identifier for reuse across requests.
    module MessageCreateParamsContainer
      extend Anthropic::Internal::Type::Union

      Variants = T.type_alias { T.any(Anthropic::ContainerParams, String) }

      sig do
        override.returns(
          T::Array[Anthropic::MessageCreateParamsContainer::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
