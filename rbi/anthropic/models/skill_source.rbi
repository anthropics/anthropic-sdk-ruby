# typed: strong

module Anthropic
  module Models
    class SkillSource < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::SkillSource, Anthropic::Internal::AnyHash)
        end

      # Where the Skill comes from.
      #
      # Possible values:
      #
      # - `"custom"`: authored by the platform user; private to their workspace
      # - `"anthropic"`: published by Anthropic; shared and read-only
      # - `"anthropic_example"`: Anthropic-published sample Skill
      # - `"plugin"`: resolved from an installed plugin
      sig { returns(Anthropic::SkillSource::Type::TaggedSymbol) }
      attr_accessor :type

      sig do
        params(type: Anthropic::SkillSource::Type::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(
        # Where the Skill comes from.
        #
        # Possible values:
        #
        # - `"custom"`: authored by the platform user; private to their workspace
        # - `"anthropic"`: published by Anthropic; shared and read-only
        # - `"anthropic_example"`: Anthropic-published sample Skill
        # - `"plugin"`: resolved from an installed plugin
        type:
      )
      end

      sig do
        override.returns({ type: Anthropic::SkillSource::Type::TaggedSymbol })
      end
      def to_hash
      end

      # Where the Skill comes from.
      #
      # Possible values:
      #
      # - `"custom"`: authored by the platform user; private to their workspace
      # - `"anthropic"`: published by Anthropic; shared and read-only
      # - `"anthropic_example"`: Anthropic-published sample Skill
      # - `"plugin"`: resolved from an installed plugin
      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::SkillSource::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CUSTOM = T.let(:custom, Anthropic::SkillSource::Type::TaggedSymbol)
        ANTHROPIC =
          T.let(:anthropic, Anthropic::SkillSource::Type::TaggedSymbol)
        ANTHROPIC_EXAMPLE =
          T.let(:anthropic_example, Anthropic::SkillSource::Type::TaggedSymbol)
        PLUGIN = T.let(:plugin, Anthropic::SkillSource::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Anthropic::SkillSource::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
