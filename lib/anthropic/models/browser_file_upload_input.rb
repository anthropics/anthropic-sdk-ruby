# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserFileUploadInput < Anthropic::Internal::Type::BaseModel
      # @!attribute target
      #   An element on the page, identified by a reference from a prior `read_page` or
      #   `find` result. References are scoped to the tab that produced them and become
      #   stale after navigation or a major re-render.
      #
      #   @return [Anthropic::Models::BrowserRefTarget]
      required :target, -> { Anthropic::BrowserRefTarget }

      # @!attribute document_ids
      #   References to files the harness has staged, for deployments where the browser
      #   executor cannot read the caller's filesystem.
      #
      #   @return [Array<String>, nil]
      optional :document_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute paths
      #   File paths on the browser executor's filesystem.
      #
      #   @return [Array<String>, nil]
      optional :paths, Anthropic::Internal::Type::ArrayOf[String], nil?: true

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(target:, document_ids: nil, paths: nil, tab_id: nil)
      #   Set the value of a file-input element to one or more files. The target must be
      #   an element reference; at least one of paths or document_ids is required.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserFileUploadInput} for more details.
      #
      #   @param target [Anthropic::Models::BrowserRefTarget] An element on the page, identified by a reference from a prior `read_page` or
      #
      #   @param document_ids [Array<String>, nil] References to files the harness has staged, for deployments where the browser ex
      #
      #   @param paths [Array<String>, nil] File paths on the browser executor's filesystem.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
