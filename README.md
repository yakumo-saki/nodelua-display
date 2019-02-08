# nodemcu-display

ESP8266 NodeMCU and Lua SH1106 display

## これは何？
http経由で表示を変更できるディスプレイです。
nodemcu上で動作する lua のプログラムになっています。
2つの液晶を同時に駆動できます。

## nodemcu build
使用するnodemcuのファームウェアは以下の通りです。
https://nodemcu-build.com/ でビルドできます。

* modules: file gpio i2c mdns net node timer u8g2 uart wifi bit
* u8g2 display, I²C = sh1106 128x64 i2c noname
* u8g2 display, SPI = 
* u8g2 fonts: (default)font_6x10_tf,(default)font_unifont_t_symbols,font_courR18_tf

## 各種設定方法
config ファイルを書き換えて下さい。

## ファイル転送方法

`nodemcu-tool` をインストール

```
// 初回のみ
nodemcu-tool --port /dev/tty.portname upload config

// 二回目以降。バージョンアップ時含む
nodemcu-tool --port /dev/tty.portname upload *.lua
```

## WebAPI

すべてのAPIは、 disp というパラメタに 1 or 2 をセットすることで表示する液晶を切り替えることができます。
省略時は 1 が仮定されます。

### clear

#### パラメタ
なし

#### 機能
画面を消去します

#### サンプル
curl http://dumbdisplay.local/clear

### string
画面を消去します

#### パラメタ

1. text （必須）表示文字列
1. x （必須）x座標
1. y （必須）y座標
1. direction （省略可） 文字を描画する方向 0 左から右（デフォルト） 1 90度右 2 180度 3 270度
1. fontsize （省略可） xl 特大 l 大 （それ以外）標準（デフォルト）
1. fontmode （省略可）フォント描画モード
1. fontcolor（省略可）フォント色

#### 機能
画面を消去します

#### サンプル

```
curl http://dumbdisplay.local/clear
```

### batch

コマンドを連続して実行させることが出来る。メモリの制限によりあまり長いコマンド文字列を投入するとエラーになる。

#### パラメタ

1. cmd （必須）コマンド文字列（後述）

#### コマンド文字列 
パラメタをカンマ(,) で区切ったもの。すなわちカンマを表示することはできない。
複数コマンドを投入する場合、改行（%0a）で区切る。
個別コマンドと異なり、パラメタの省略はできない。

##### 画面クリアコマンド

1. 固定文字列 clr

#### 文字描画コマンド

1. 固定文字列 msg
1. x座標
1. y座標
1. フォントサイズ
1. メッセージ
1. 色
1. 描画モード
1. 描画方向

#### サンプル

```
curl http://dumbdisplay.local/batch?cmd=clr%0amsg%0910%0920%09xl%09message%091%091%091
```

## thanks
* httpServer.lua - https://github.com/wangzexi/NodeMCU-HTTP-Server
