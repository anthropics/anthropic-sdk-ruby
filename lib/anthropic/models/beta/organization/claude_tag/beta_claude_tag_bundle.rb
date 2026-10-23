# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles#retrieve
          class BetaClaudeTagBundle < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The Bundle's identifier. Starts with `capp_`.
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   Time the Bundle was created.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute description
            #   What the Bundle is for. Null when it has none. Read-only.
            #
            #   @return [String, nil]
            required :description, String, nil?: true

            # @!attribute display_name
            #   The Bundle's name. Always set. Read-only.
            #
            #   @return [String]
            required :display_name, String

            # @!attribute type
            #
            #   @return [Symbol, :bundle]
            required :type, const: :bundle

            # @!attribute updated_at
            #   Time of the last change to the Bundle.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!method initialize(id:, created_at:, description:, display_name:, updated_at:, type: :bundle)
            #   A named set of access that Claude can use in a Slack channel or a Slack
            #   workspace: connectors, repositories and credentials. Created and edited in
            #   claude.ai.
            #
            #   @param id [String] The Bundle's identifier. Starts with `capp_`.
            #
            #   @param created_at [Time] Time the Bundle was created.
            #
            #   @param description [String, nil] What the Bundle is for. Null when it has none. Read-only.
            #
            #   @param display_name [String] The Bundle's name. Always set. Read-only.
            #
            #   @param updated_at [Time] Time of the last change to the Bundle.
            #
            #   @param type [Symbol, :bundle]
          end
        end
      end
    end
  end
end
