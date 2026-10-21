# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLImageSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # URL of the image to fetch.
          sig { returns(String) }
          attr_accessor :url

          # Image referenced by URL.
          sig { params(url: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # URL of the image to fetch.
            url:,
            type: :url
          )
          end

          sig { override.returns({ type: Symbol, url: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
