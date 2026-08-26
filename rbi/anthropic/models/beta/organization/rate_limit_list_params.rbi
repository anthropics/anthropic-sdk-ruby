# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class RateLimitListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::RateLimitListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Filter by group type.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::OrSymbol
              )
            )
          end
          attr_accessor :group_type

          # Maximum number of items to return per page. Ranges from `1` to `1000`.
          #
          # Accepted for request-shape compatibility and currently ignored: every entry is
          # returned in a single page.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :limit

          # Filter to the single entry containing this model. Accepts full model names and
          # aliases. Returns 404 if the model is not found or has no rate limits for this
          # organization.
          sig { returns(T.nilable(String)) }
          attr_accessor :model

          # Opaque cursor from a previous response's `next_page`.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          sig do
            params(
              group_type:
                T.nilable(
                  Anthropic::Beta::Organization::RateLimitListParams::GroupType::OrSymbol
                ),
              limit: T.nilable(Integer),
              model: T.nilable(String),
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Filter by group type.
            group_type: nil,
            # Maximum number of items to return per page. Ranges from `1` to `1000`.
            #
            # Accepted for request-shape compatibility and currently ignored: every entry is
            # returned in a single page.
            limit: nil,
            # Filter to the single entry containing this model. Accepts full model names and
            # aliases. Returns 404 if the model is not found or has no rate limits for this
            # organization.
            model: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                group_type:
                  T.nilable(
                    Anthropic::Beta::Organization::RateLimitListParams::GroupType::OrSymbol
                  ),
                limit: T.nilable(Integer),
                model: T.nilable(String),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Filter by group type.
          module GroupType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::RateLimitListParams::GroupType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BATCH =
              T.let(
                :batch,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )
            FILES =
              T.let(
                :files,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )
            MODEL_GROUP =
              T.let(
                :model_group,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )
            SKILLS =
              T.let(
                :skills,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )
            TOKEN_COUNT =
              T.let(
                :token_count,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )
            WEB_SEARCH =
              T.let(
                :web_search,
                Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::RateLimitListParams::GroupType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
