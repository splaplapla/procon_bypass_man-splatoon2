module ProconBypassMan
  module Plugin
    module Splatoon2
      module Macro
        module ChargeTansanBomb
          def self.display_name
            :charge_tansan_bomb
          end

          # procon_bypass_man: 0.1.22以上が必要
          def self.steps
            [:shake_left_stick_and_toggle_b_for_0_1sec].freeze
          end

          def self.description
            'タンサンボムのチャージ'
          end
        end
      end
    end
  end
end
