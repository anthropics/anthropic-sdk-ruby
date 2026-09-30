# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::PluginMarketplaces#validate_archive
        class BetaPluginMarketplaceValidationReport < Anthropic::Internal::Type::BaseModel
          # @!attribute commit_sha
          #   The full SHA of the commit that was validated: for a repository, the commit that
          #   was read; for an uploaded archive, the commit recorded in the archive's comment
          #   (as a Git host's download writes it; not verified), else null.
          #
          #   @return [String, nil]
          required :commit_sha, String, nil?: true

          # @!attribute manifest_error
          #   Set when nothing could be validated: the repository or archive could not be
          #   read, or marketplace.json is missing, malformed or over a limit. Null otherwise.
          #
          #   @return [String, nil]
          required :manifest_error, String, nil?: true

          # @!attribute manifest_error_code
          #   A stable identifier for `manifest_error`; null when that is.
          #
          #   @return [String, nil]
          required :manifest_error_code, String, nil?: true

          # @!attribute plugin_errors
          #   One entry per plugin a synchronization would skip entirely, keyed by the
          #   plugin's name in marketplace.json.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginError>]
          required :plugin_errors,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError] }

          # @!attribute plugin_warnings
          #   One entry per plugin that would synchronize with some of its contents left out,
          #   keyed by the plugin's name in marketplace.json.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings>]
          required :plugin_warnings,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings] }

          # @!attribute ref
          #   For a repository, the branch that was read by name: the one requested, or else
          #   the branch a synchronization of this repository is set to read. Null when no
          #   branch is named or set and the repository's default branch was read, for a
          #   request by commit SHA, and for an uploaded archive.
          #
          #   @return [String, nil]
          required :ref, String, nil?: true

          # @!attribute total_plugin_count
          #   How many plugins marketplace.json declares; 0 when it could not be read.
          #
          #   @return [Integer]
          required :total_plugin_count, Integer

          # @!attribute type
          #   Always `plugin_marketplace_validation_report`.
          #
          #   @return [Symbol, :plugin_marketplace_validation_report]
          required :type, const: :plugin_marketplace_validation_report

          # @!attribute valid
          #   True when marketplace.json is well-formed and no plugin would be skipped;
          #   warnings never make it false.
          #
          #   @return [Boolean]
          required :valid, Anthropic::Internal::Type::Boolean

          # @!method initialize(commit_sha:, manifest_error:, manifest_error_code:, plugin_errors:, plugin_warnings:, ref:, total_plugin_count:, valid:, type: :plugin_marketplace_validation_report)
          #   The outcome of validating plugin marketplace content: a report, not a stored
          #   object, so nothing in it can be retrieved afterwards.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationReport}
          #   for more details.
          #
          #   @param commit_sha [String, nil] The full SHA of the commit that was validated: for a repository, the commit that
          #
          #   @param manifest_error [String, nil] Set when nothing could be validated: the repository or archive could not be read
          #
          #   @param manifest_error_code [String, nil] A stable identifier for `manifest_error`; null when that is.
          #
          #   @param plugin_errors [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginError>] One entry per plugin a synchronization would skip entirely, keyed by the plugin'
          #
          #   @param plugin_warnings [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings>] One entry per plugin that would synchronize with some of its contents left out,
          #
          #   @param ref [String, nil] For a repository, the branch that was read by name: the one requested, or else t
          #
          #   @param total_plugin_count [Integer] How many plugins marketplace.json declares; 0 when it could not be read.
          #
          #   @param valid [Boolean] True when marketplace.json is well-formed and no plugin would be skipped; warnin
          #
          #   @param type [Symbol, :plugin_marketplace_validation_report] Always `plugin_marketplace_validation_report`.
        end
      end
    end
  end
end
