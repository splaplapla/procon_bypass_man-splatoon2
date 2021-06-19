module ProconBypassMan
  module Splatoon2
    module Macro
      module FastReturn
        def self.name
          :fast_return
        end

        def self.steps
          [:down, :a, :a, :x, :down, :a, :a].freeze
        end
      end
    end
  end
end
