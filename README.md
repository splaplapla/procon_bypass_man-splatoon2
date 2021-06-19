# ProconBypassMan::Splatoon2

スプラトゥーン2用 https://github.com/splaspla-hacker/procon_bypass_man のプラグインです。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'procon_bypass_man-splatoon2', github: 'splaspla-hacker/procon_bypass_man-splatoon2'
```

And then execute:

    $ bundle install

## Usage


```ruby
ProconBypassMan.run do
  prefix_keys_for_changing_layer [:zr, :r, :zl, :l]
  load_macro_plugin ProconBypassMan::Splatoon2::Macro::FastReturn
  load_mode_plugin ProconBypassMan::Splatoon2::Mode::Guruguru

  layer :up, mode: :manual do
    macro ProconBypassMan::Splatoon2::Macro::FastReturn.name, if_pressed: [:y, :b, :down]
  end
  layer :right, mode: ProconBypassMan::Splatoon2::Mode::Guruguru.name
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

## Code of Conduct

Everyone interacting in the ProconBypassMan::Splatoon2 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/procon_bypass_man-splatoon2/blob/master/CODE_OF_CONDUCT.md).
