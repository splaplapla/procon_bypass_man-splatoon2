# ProconBypassMan::Plugin::Splatoon2

https://github.com/splaplapla/procon_bypass_man のスプラトゥーン2用プラグインです。

## 使用例

```ruby
#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'procon_bypass_man'
  gem 'procon_bypass_man-splatoon2', github: 'splaplapla/procon_bypass_man-splatoon2', tag: "0.1.1"
end

ProconBypassMan.run(setting: "./setting.yml")
```

setting.yml

```yaml
version: 1.0
setting: |-
  fast_return = ProconBypassMan::Plugin::Splatoon2::Macro::FastReturn
  guruguru = ProconBypassMan::Plugin::Splatoon2::Mode::Guruguru

  install_macro_plugin fast_return
  install_mode_plugin guruguru

  prefix_keys_for_changing_layer [:zr, :r, :zl, :l]

  layer :up, mode: :manual do
    flip :zr, if_pressed: :zr, force_neutral: :zl
    flip :zl, if_pressed: [:y, :b, :zl]
    flip :down, if_pressed: :down
    macro fast_return.name, if_pressed: [:y, :b, :down]
    remap :l, to: :zr
  end
  layer :right, mode: guruguru.name
  layer :left do
    # no-op
  end
  layer :down do
    flip :zl
  end
```

## モード
### guruguru
* 適当にうろうろします
  * 試合中、無操作による切断を防ぐためやデバッグ用途です

(TODO 動画を貼る)

## マクロ
### ProconBypassMan::Plugin::Splatoon2::Macro::FastReturn
* 試合中にリスポーンに戻る操作を実行します

### ProconBypassMan::Plugin::Splatoon2::Macro::JumpToUpKey
* 試合中に上キーに割り当てられている味方へのスーパージャンプを実行します

### ProconBypassMan::Plugin::Splatoon2::Macro::JumpToRightKey
* 試合中に右キーに割り当てられている味方へのスーパージャンプを実行します

### ProconBypassMan::Plugin::Splatoon2::Macro::JumpToLeftKey
* 試合中に左キーに割り当てられている味方へのスーパージャンプを実行します

(TODO 動画を貼る)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/splaplapla/procon_bypass_man-splatoon2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/splaplapla/procon_bypass_man-splatoon2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
