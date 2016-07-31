# igor-override

override.ipf provides a function overriding constants.

## Background

Overriding constants is useful because one can tune behavior of procedures without touching the code. 

```
strconstant SampleMenu = "Sample"
Menu SampleMenu
  "SampleFunction"
EndMenu
```

In the above procedure, one can change the title in menu bar by overriding a string constant.
However, statements of overriding must be written on a main procedure window (open by `Ctrl+M` or `Cmd+M`) in **every** experiment file.
It is such a hassle!

## Usage
Download overrid.ipf in your `User Procedures` folder. 
Then write as below on a file in your `User Procedures` or `Igor Procedures` (The latter is recommended because files in this folder are automatically loaded when Igor Pro starts).

```
#include "override"
Function Igorrc()
  override("SampleMenu=Macros")
  override("SampleFont=Arial")
  override("SampleOptionEnable=1")
End
```

Once you execute Igorrc, all statements for overriding are inserted in your main procedure window.

```
override constant SampleOptionEnable=1
override strconstant SampleFont="Arial"
override strconstant SampleMenu="Macros"
```
