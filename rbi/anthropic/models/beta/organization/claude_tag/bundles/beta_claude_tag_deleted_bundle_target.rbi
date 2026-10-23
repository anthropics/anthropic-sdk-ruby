# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagDeletedBundleTarget < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagDeletedBundleTarget,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The identifier the Bundle Target had.
              sig { returns(String) }
              attr_accessor :id

              sig { returns(Symbol) }
              attr_accessor :type

              # Confirms that a Bundle was detached.
              sig { params(id: String, type: Symbol).returns(T.attached_class) }
              def self.new(
                # The identifier the Bundle Target had.
                id:,
                type: :bundle_target_deleted
              )
              end

              sig { override.returns({ id: String, type: Symbol }) }
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
