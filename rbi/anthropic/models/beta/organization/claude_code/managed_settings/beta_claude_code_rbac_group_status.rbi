# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            module BetaClaudeCodeRBACGroupStatus
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive,
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted,
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ACTIVE =
                  T.let(
                    :active,
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type::TaggedSymbol
                  )
                DELETED =
                  T.let(
                    :deleted,
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type::TaggedSymbol
                  )
                UNKNOWN =
                  T.let(
                    :unknown,
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type::OrSymbol
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Variants
                )
              end
              def self.new(type:)
              end
            end
          end
        end
      end
    end
  end
end
