module ProconBypassMan
  module Plugin
    module Splatoon2
      module Macro
        module JumpToLeftKey
          def self.display_name
            :jump_to_left_key
          end

          def self.steps
            [:x, :left, :a, :a].freeze
          end
        end
      end
    end
  end
end
