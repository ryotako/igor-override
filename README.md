# igor-override

このプロシージャファイルはIgor Proで定数の上書きを行う関数を提供します。

## 背景

たとえば次のようなIgor Proのプロシージャでは、定数を上書き(override)することによってメニューバーの表示を変えることができます。

```
strconstant SampleMenu = "Sample"
Menu SampleMenu
  "SampleFunction"
EndMenu
```

このように、定数の上書きを利用するとプロシージャファイルそのものに手を触れずにプロシージャの挙動を変更することができます。
しかし定数の上書きはメインプロシージャウィンドウで宣言する必要があるため、新しいエクスペリメントを作成するたびにoverride文を書き直さなければなりませんでした。

## 使い方

Igor Proceduresフォルダ上のipfファイルに以下のように書き、Igorrc()関数を実行すると複数の定数を一度に上書きすることができます。

```
#include "override"
Function Igorrc()
  override("SampleMenu=Macros")
  override("SampleFont=Arial")
  override("SampleOptionEnable=1")
End
```

この例の場合、メインプロシージャウィンドウに以下の内容が挿入され、コンパイルされます。

```
override constant SampleOptionEnable=1
override strconstant SampleFont="Arial"
override strconstant SampleMenu="Macros"
```

この状態でoverride("SampleOptionEnable=1")を実行しても何も起こりませんが、override("SampleOptionEnable=0")のように値の変更がある場合には再度上書きが行われ、メインプロシージャウィンドウの内容は次のようになります。

```
override constant SampleOptionEnable=0
override constant SampleOptionEnable=1
override strconstant SampleFont="Arial"
override strconstant SampleMenu="Macros"
```
