# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            module BetaClaudeCodeRBACGroupStatus
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :active,
                      -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive }

              variant :deleted,
                      -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted }

              variant :unknown,
                      -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown }

              module Type
                extend Anthropic::Internal::Type::Enum

                ACTIVE = :active
                DELETED = :deleted
                UNKNOWN = :unknown

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown]
              def self.new(type:, **args)
                case type.to_sym
                when :active
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive.new(
                    **args
                  )
                when :deleted
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted.new(
                    **args
                  )
                when :unknown
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown.new(
                    **args
                  )
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
