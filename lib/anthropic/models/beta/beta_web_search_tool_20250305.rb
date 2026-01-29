# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebSearchTool20250305 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute type
        #
        #   @return [Symbol, :web_search_20250305]
        required :type, const: :web_search_20250305

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaWebSearchTool20250305::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaWebSearchTool20250305::AllowedCaller] }

        # @!attribute allowed_domains
        #   If provided, only these domains will be included in results. Cannot be used
        #   alongside `blocked_domains`.
        #
        #   @return [Array<String>, nil]
        optional :allowed_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute blocked_domains
        #   If provided, these domains will never appear in results. Cannot be used
        #   alongside `allowed_domains`.
        #
        #   @return [Array<String>, nil]
        optional :blocked_domains, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute defer_loading
        #   If true, tool will not be included in initial system prompt. Only loaded when
        #   returned via tool_reference from tool search.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

        # @!attribute max_uses
        #   Maximum number of times the tool can be used in the API request.
        #
        #   @return [Integer, nil]
        optional :max_uses, Integer, nil?: true

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!attribute user_location
        #   Parameters for the user's location. Used to provide more relevant search
        #   results.
        #
        #   @return [Anthropic::Models::Beta::BetaWebSearchTool20250305::UserLocation, nil]
        optional :user_location, -> { Anthropic::Beta::BetaWebSearchTool20250305::UserLocation }, nil?: true

        # @!method initialize(allowed_callers: nil, allowed_domains: nil, blocked_domains: nil, cache_control: nil, defer_loading: nil, max_uses: nil, strict: nil, user_location: nil, name: :web_search, type: :web_search_20250305)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebSearchTool20250305} for more details.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaWebSearchTool20250305::AllowedCaller>]
        #
        #   @param allowed_domains [Array<String>, nil] If provided, only these domains will be included in results. Cannot be used alon
        #
        #   @param blocked_domains [Array<String>, nil] If provided, these domains will never appear in results. Cannot be used alongsid
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param max_uses [Integer, nil] Maximum number of times the tool can be used in the API request.
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param user_location [Anthropic::Models::Beta::BetaWebSearchTool20250305::UserLocation, nil] Parameters for the user's location. Used to provide more relevant search results
        #
        #   @param name [Symbol, :web_search] Name of the tool.
        #
        #   @param type [Symbol, :web_search_20250305]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Anthropic::Models::Beta::BetaWebSearchTool20250305#user_location
        class UserLocation < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :approximate]
          required :type, const: :approximate

          # @!attribute city
          #   The city of the user.
          #
          #   @return [String, nil]
          optional :city, String, nil?: true

          # @!attribute country
          #   The two letter
          #   [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
          #   user.
          #
          #   @return [String, nil]
          optional :country, String, nil?: true

          # @!attribute region
          #   The region of the user.
          #
          #   @return [String, nil]
          optional :region, String, nil?: true

          # @!attribute timezone
          #   The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          #
          #   @return [String, nil]
          optional :timezone, String, nil?: true

          # @!method initialize(city: nil, country: nil, region: nil, timezone: nil, type: :approximate)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::BetaWebSearchTool20250305::UserLocation} for more
          #   details.
          #
          #   Parameters for the user's location. Used to provide more relevant search
          #   results.
          #
          #   @param city [String, nil] The city of the user.
          #
          #   @param country [String, nil] The two letter [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha
          #
          #   @param region [String, nil] The region of the user.
          #
          #   @param timezone [String, nil] The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          #
          #   @param type [Symbol, :approximate]
        end
      end
    end

    BetaWebSearchTool20250305 = Beta::BetaWebSearchTool20250305
  end
end
