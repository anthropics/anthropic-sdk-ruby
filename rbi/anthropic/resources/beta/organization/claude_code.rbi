# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings
            )
          end
          attr_reader :managed_settings

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
