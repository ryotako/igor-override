# igor-override

このプロシージャファイルはIgor Proで定数の上書きを行う関数を提供します。


たとえば次のようなIgor Proのプロシージャでは、定数を上書き(override)することによってメニューバーの表示を変えることができます。

```
strconstant SampleMenu = "Sample"
Menu SampleMenu
  "SampleFunction"
EndMenu
```

このように、定数の上書きを利用するとプロシージャファイルそのものに手を触れずにプロシージャの挙動を変更することができます。
しかし定数の上書きはメインプロシージャウィンドウで宣言する必要があるため、新しいエクスペリメントを作成するたびに宣言し直す必要があります。

Igor Proceduresフォルダ上のipfファイルに以下のように書き、Igorrc()関数を実行すると、そのエクスペリメントのメインプロシージャウィンドウを使って複数の定数を一度に上書きすることができます。

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

