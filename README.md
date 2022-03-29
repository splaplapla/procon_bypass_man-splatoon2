# ProconBypassMan::Plugin::Splatoon2

* https://github.com/splaplapla/procon_bypass_man のスプラトゥーン2用プラグインです。
* 本プラグインは新しめの procon_bypass_man に同梱しているので明示的に読み込む必要はありません

## 使用例

```ruby
#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'procon_bypass_man'
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
    macro fast_return, if_pressed: [:y, :b, :down]
    remap :l, to: :zr
  end
  layer :right, mode: guruguru
  layer :left do
    # no-op
  end
  layer :down do
    flip :zl
  end
```

## モード
### ProconBypassMan::Plugin::Splatoon2::Mode::Guruguru
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

### ProconBypassMan::Plugin::Splatoon2::Macro::SokuwariForSplashBomb
* スプラッシュボムなサブを使って1個のバブルを即割します
* スペシャルとインクタンクが溜まっている状態で実行してください
* このマクロは、ボムと投げた後にスペシャル発動し、バブルを1つ投げてから、ボムをもう一度投げバブルを割ります

https://user-images.githubusercontent.com/1664497/152633242-da01697f-12ae-496a-9d7f-22eda62cf8dd.mp4

### ProconBypassMan::Plugin::Splatoon2::Macro::ChargeTansanBomb
* 左スティックを高速に左右にシェイクするマクロです
* タンサンボムを貯めるのに使います

https://user-images.githubusercontent.com/1664497/160649435-52b084ed-05b0-4c58-88ba-667b5f256405.mp4

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/splaplapla/procon_bypass_man-splatoon2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/splaplapla/procon_bypass_man-splatoon2/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
