# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          class Google
            class Projects
              sig do
                returns(
                  Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls
                )
              end
              attr_reader :data_controls

              # @api private
              sig do
                params(client: Anthropic::Client).returns(T.attached_class)
              end
              def self.new(client:)
              end
            end
          end
        end
      end
    end
  end
end
