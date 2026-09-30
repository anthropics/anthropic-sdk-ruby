# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationReport < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationReport,
                Anthropic::Internal::AnyHash
              )
            end

          # The full SHA of the commit that was validated: for a repository, the commit that
          # was read; for an uploaded archive, the commit recorded in the archive's comment
          # (as a Git host's download writes it; not verified), else null.
          sig { returns(T.nilable(String)) }
          attr_accessor :commit_sha

          # Set when nothing could be validated: the repository or archive could not be
          # read, or marketplace.json is missing, malformed or over a limit. Null otherwise.
          sig { returns(T.nilable(String)) }
          attr_accessor :manifest_error

          # A stable identifier for `manifest_error`; null when that is.
          sig { returns(T.nilable(String)) }
          attr_accessor :manifest_error_code

          # One entry per plugin a synchronization would skip entirely, keyed by the
          # plugin's name in marketplace.json.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError
              ]
            )
          end
          attr_accessor :plugin_errors

          # One entry per plugin that would synchronize with some of its contents left out,
          # keyed by the plugin's name in marketplace.json.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings
              ]
            )
          end
          attr_accessor :plugin_warnings

          # For a repository, the branch that was read by name: the one requested, or else
          # the branch a synchronization of this repository is set to read. Null when no
          # branch is named or set and the repository's default branch was read, for a
          # request by commit SHA, and for an uploaded archive.
          sig { returns(T.nilable(String)) }
          attr_accessor :ref

          # How many plugins marketplace.json declares; 0 when it could not be read.
          sig { returns(Integer) }
          attr_accessor :total_plugin_count

          # Always `plugin_marketplace_validation_report`.
          sig { returns(Symbol) }
          attr_accessor :type

          # True when marketplace.json is well-formed and no plugin would be skipped;
          # warnings never make it false.
          sig { returns(T::Boolean) }
          attr_accessor :valid

          # The outcome of validating plugin marketplace content: a report, not a stored
          # object, so nothing in it can be retrieved afterwards.
          sig do
            params(
              commit_sha: T.nilable(String),
              manifest_error: T.nilable(String),
              manifest_error_code: T.nilable(String),
              plugin_errors:
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError::OrHash
                ],
              plugin_warnings:
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings::OrHash
                ],
              ref: T.nilable(String),
              total_plugin_count: Integer,
              valid: T::Boolean,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The full SHA of the commit that was validated: for a repository, the commit that
            # was read; for an uploaded archive, the commit recorded in the archive's comment
            # (as a Git host's download writes it; not verified), else null.
            commit_sha:,
            # Set when nothing could be validated: the repository or archive could not be
            # read, or marketplace.json is missing, malformed or over a limit. Null otherwise.
            manifest_error:,
            # A stable identifier for `manifest_error`; null when that is.
            manifest_error_code:,
            # One entry per plugin a synchronization would skip entirely, keyed by the
            # plugin's name in marketplace.json.
            plugin_errors:,
            # One entry per plugin that would synchronize with some of its contents left out,
            # keyed by the plugin's name in marketplace.json.
            plugin_warnings:,
            # For a repository, the branch that was read by name: the one requested, or else
            # the branch a synchronization of this repository is set to read. Null when no
            # branch is named or set and the repository's default branch was read, for a
            # request by commit SHA, and for an uploaded archive.
            ref:,
            # How many plugins marketplace.json declares; 0 when it could not be read.
            total_plugin_count:,
            # True when marketplace.json is well-formed and no plugin would be skipped;
            # warnings never make it false.
            valid:,
            # Always `plugin_marketplace_validation_report`.
            type: :plugin_marketplace_validation_report
          )
          end

          sig do
            override.returns(
              {
                commit_sha: T.nilable(String),
                manifest_error: T.nilable(String),
                manifest_error_code: T.nilable(String),
                plugin_errors:
                  T::Array[
                    Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError
                  ],
                plugin_warnings:
                  T::Array[
                    Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings
                  ],
                ref: T.nilable(String),
                total_plugin_count: Integer,
                type: Symbol,
                valid: T::Boolean
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
