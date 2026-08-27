# typed: strong

module Anthropic
  module Models
    BetaSkillSource = Beta::BetaSkillSource

    module Beta
      class BetaSkillSource < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSkillSource,
              Anthropic::Internal::AnyHash
            )
          end

        # Where the Skill comes from.
        #
        # Possible values:
        #
        # - `"custom"`: authored by the platform user; private to their workspace
        # - `"anthropic"`: published by Anthropic; shared and read-only
        # - `"anthropic_example"`: Anthropic-published sample Skill
        # - `"plugin"`: resolved from an installed plugin
        sig { returns(Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol) }
        attr_accessor :type

        sig do
          params(
            type: Anthropic::Beta::BetaSkillSource::Type::OrSymbol
          ).returns(T.attached_class)
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
          override.returns(
            { type: Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol }
          )
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
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaSkillSource::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(:custom, Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol)
          ANTHROPIC =
            T.let(
              :anthropic,
              Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol
            )
          ANTHROPIC_EXAMPLE =
            T.let(
              :anthropic_example,
              Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol
            )
          PLUGIN =
            T.let(:plugin, Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaSkillSource::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
