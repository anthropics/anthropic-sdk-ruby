# typed: strong

module Anthropic
  module Models
    class WebSearchTool20250305 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebSearchTool20250305, Anthropic::Internal::AnyHash)
        end

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in `tool_use` blocks.
      sig { returns(Symbol) }
      attr_accessor :name

      sig { returns(Symbol) }
      attr_accessor :type

      # If provided, only these domains will be included in results. Cannot be used
      # alongside `blocked_domains`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :allowed_domains

      # If provided, these domains will never appear in results. Cannot be used
      # alongside `allowed_domains`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :blocked_domains

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Maximum number of times the tool can be used in the API request.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_uses

      # Parameters for the user's location. Used to provide more relevant search
      # results.
      sig { returns(T.nilable(Anthropic::WebSearchTool20250305::UserLocation)) }
      attr_reader :user_location

      sig do
        params(
          user_location:
            T.nilable(Anthropic::WebSearchTool20250305::UserLocation::OrHash)
        ).void
      end
      attr_writer :user_location

      sig do
        params(
          allowed_domains: T.nilable(T::Array[String]),
          blocked_domains: T.nilable(T::Array[String]),
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          max_uses: T.nilable(Integer),
          user_location:
            T.nilable(Anthropic::WebSearchTool20250305::UserLocation::OrHash),
          name: Symbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # If provided, only these domains will be included in results. Cannot be used
        # alongside `blocked_domains`.
        allowed_domains: nil,
        # If provided, these domains will never appear in results. Cannot be used
        # alongside `allowed_domains`.
        blocked_domains: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Maximum number of times the tool can be used in the API request.
        max_uses: nil,
        # Parameters for the user's location. Used to provide more relevant search
        # results.
        user_location: nil,
        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        name: :web_search,
        type: :web_search_20250305
      )
      end

      sig do
        override.returns(
          {
            name: Symbol,
            type: Symbol,
            allowed_domains: T.nilable(T::Array[String]),
            blocked_domains: T.nilable(T::Array[String]),
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            max_uses: T.nilable(Integer),
            user_location:
              T.nilable(Anthropic::WebSearchTool20250305::UserLocation)
          }
        )
      end
      def to_hash
      end

      class UserLocation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::WebSearchTool20250305::UserLocation,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The city of the user.
        sig { returns(T.nilable(String)) }
        attr_accessor :city

        # The two letter
        # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
        # user.
        sig { returns(T.nilable(String)) }
        attr_accessor :country

        # The region of the user.
        sig { returns(T.nilable(String)) }
        attr_accessor :region

        # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
        sig { returns(T.nilable(String)) }
        attr_accessor :timezone

        # Parameters for the user's location. Used to provide more relevant search
        # results.
        sig do
          params(
            city: T.nilable(String),
            country: T.nilable(String),
            region: T.nilable(String),
            timezone: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the user.
          city: nil,
          # The two letter
          # [ISO country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) of the
          # user.
          country: nil,
          # The region of the user.
          region: nil,
          # The [IANA timezone](https://nodatime.org/TimeZones) of the user.
          timezone: nil,
          type: :approximate
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              city: T.nilable(String),
              country: T.nilable(String),
              region: T.nilable(String),
              timezone: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
