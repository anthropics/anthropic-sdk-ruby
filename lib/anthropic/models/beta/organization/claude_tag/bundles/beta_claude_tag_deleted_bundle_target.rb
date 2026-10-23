# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets#delete
            class BetaClaudeTagDeletedBundleTarget < Anthropic::Internal::Type::BaseModel
              # @!attribute id
              #   The identifier the Bundle Target had.
              #
              #   @return [String]
              required :id, String

              # @!attribute type
              #
              #   @return [Symbol, :bundle_target_deleted]
              required :type, const: :bundle_target_deleted

              # @!method initialize(id:, type: :bundle_target_deleted)
              #   Confirms that a Bundle was detached.
              #
              #   @param id [String] The identifier the Bundle Target had.
              #
              #   @param type [Symbol, :bundle_target_deleted]
            end
          end
        end
      end
    end
  end
end
