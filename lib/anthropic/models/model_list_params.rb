# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Models#list
    class ModelListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute after_id
      #   ID of the object to use as a cursor for pagination. When provided, returns the
      #   page of results immediately after this object.
      #
      #   @return [String, nil]
      optional :after_id, String

      # @!attribute before_id
      #   ID of the object to use as a cursor for pagination. When provided, returns the
      #   page of results immediately before this object.
      #
      #   @return [String, nil]
      optional :before_id, String

      # @!attribute lifecycle
      #   Filter the list to models in any of the given lifecycle stages (`active`,
      #   `deprecated`, or `retired`). Up to 3 values. When omitted, the list contains the
      #   `active` and `deprecated` models; `retired` models appear only when `retired` is
      #   requested explicitly.
      #
      #   @return [Array<Symbol, Anthropic::Models::ModelListParams::Lifecycle>, nil]
      optional :lifecycle,
               -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::ModelListParams::Lifecycle] }

      # @!attribute limit
      #   Number of items to return per page.
      #
      #   Defaults to `20`. Ranges from `1` to `1000`.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute betas
      #   @deprecated Deprecated. This parameter will be removed from this method in a future release.
      #   To use beta features, call the beta models methods (`client.beta.models`)
      #   instead.
      #
      #   Optional header to specify the beta version(s) you want to use.
      #
      #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
      optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

      # @!attribute workspace_id
      #   Optional header to select the Workspace for this request. The value is a
      #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
      #
      #   Only needed for credentials that can act on more than one Workspace. A
      #   credential that belongs to a specific Workspace may omit it; if sent, it must
      #   match that Workspace.
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(after_id: nil, before_id: nil, lifecycle: nil, limit: nil, betas: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ModelListParams} for more details.
      #
      #   @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
      #
      #   @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
      #
      #   @param lifecycle [Array<Symbol, Anthropic::Models::ModelListParams::Lifecycle>] Filter the list to models in any of the given lifecycle stages (`active`, `depre
      #
      #   @param limit [Integer] Number of items to return per page.
      #
      #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
      #
      #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

      module Lifecycle
        extend Anthropic::Internal::Type::Enum

        ACTIVE = :active
        DEPRECATED = :deprecated
        RETIRED = :retired

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
