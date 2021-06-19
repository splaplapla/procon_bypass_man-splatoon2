# ProconBypassMan::Splatoon2

スプラトゥーン2用 https://github.com/splaspla-hacker/procon_bypass_man のプラグインです。

## 使用例
```ruby
#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'procon_bypass_man', github: 'splaspla-hacker/procon_bypass_man', branch: "edge"
  gem 'procon_bypass_man-splatoon2', github: 'splaspla-hacker/procon_bypass_man-splatoon2', branch: "master"
end

ProconBypassMan.tap do |pbm|
  pbm.logger = "./app.log"
  pbm.logger.level = :debug
end

fast_return = ProconBypassMan::Splatoon2::Macro::FastReturn
guruguru = ProconBypassMan::Splatoon2::Mode::Guruguru

ProconBypassMan.run do
  install_macro_plugin fast_return
  install_mode_plugin guruguru

  prefix_keys_for_changing_layer [:zr, :r, :zl, :l]

  layer :up, mode: :manual do
    flip :zr, if_pressed: :zr, force_neutral: :zl
    flip :zl, if_pressed: [:y, :b, :zl]
    flip :down, if_pressed: :down
    macro fast_return.name, if_pressed: [:y, :b, :down]
  end
  layer :right, mode: guruguru.name
  layer :left do
    # no-op
  end
  layer :down do
    flip :zl
  end
end
```

## モード
### guruguru
* 適当にうろうろします
  * 試合中、無操作による切断を防ぐためやデバッグ用途です

(TODO 動画を貼る)

## マクロ
### fast_return
* 試合中にリスポーンに戻る操作を実行するマクロです

(TODO 動画を貼る)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/procon_bypass_man-splatoon2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/procon_bypass_man-splatoon2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
