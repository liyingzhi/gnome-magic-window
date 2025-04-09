#Requires AutoHotkey v2.0
#SingleInstance Force
;;; 如果 flowLaunch 没有启动的话，启动
{
    ; 定义 flowLaunch 的可执行文件路径
    flowLaunchPath := "C:\Users\liyin\scoop\apps\flow-launcher\current\Flow.Launcher.exe"
    if not WinExist("ahk_exe Flow.Launcher.exe")
    {
        Run flowLaunchPath
    }
}

;;; 如果 flameShot 没有启动的话，启动
{
    ; 定义 flameShot 的可执行文件路径
    flameShotPath := "D:\Program Files\Flameshot\bin\flameshot.exe"
    if not WinExist("ahk_exe flameshot.exe")
    {
        Run flameShotPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+J` 用于测试 debug
^!j::
{
    MsgBox "The active window's ID is " WinExist("A")
}

;;; 注册快捷键 `Ctrl+Alt+A` 用于 Flameshot 截图
^!a::
{
    Send("{PrintScreen}")  ; 模拟按下 Print Screen 键
}

;;; 注册快捷键 `Ctrl+Alt+D` 用于模拟发送 Win+d 按键，用于显示桌面
^!d::
{
      Send("#d")
}

;;; 注册快捷键 `Ctrl+Shift+f` 用于最大化/正常化光标下激活的窗口
^+f::
{
    ; 通过鼠标所在的位置判断 window id
    ; MouseGetPos , , &id, &control

    ; Retrieves and reports the unique ID(hwnd) of the active window
    id := WinExist("A")
    if id
    {
       try
       {
          MinMax := WinGetMinMax(id)
          if (MinMax = -1 || MinMax = 0)
          {
           WinMaximize id
               ;MsgBox MinMax
          }
          else {
             WinRestore id
          }
       }
       catch
       {
       MsgBox "未找到窗口。"
       }
    }
    else
    {
        MsgBox "No active windows"
    }
}

;;; 注册快捷键 `Ctrl+Alt+c` 用于关闭当前光标所在 app
^!c::
{
    ; 通过鼠标所在的位置判断 window id
    ; MouseGetPos , , &id, &control

    ; Retrieves and reports the unique ID(hwnd) of the active window
    id := WinExist("A")
    if id
    {
       winClassName := WinGetClass(id)
       if not (winClassName ~= "i)\A(Progman)\z")
       {
           ; 关闭该窗口
           WinClose id
       }
    }
    else
    {
        MsgBox "No active windows"
    }
}

;;; 注册快捷键 `Ctrl+Alt+E` 用于打开 emacs
^!e::
{
    ; 定义 Emacs 的可执行文件路径
    emacsPath := "D:\Program Files\emacs-29.4\bin\runemacs.exe"

    ; 检查 Emacs 是否已经运行
    if WinExist("ahk_exe emacs.exe")
    {
        ; 如果 Emacs 已经运行，则激活窗口
        WinActivate
    }
    else   {
        ; 如果 Emacs 没有运行，则启动 Emacs
        Run emacsPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+F` 用于打开 edge 浏览器
^!f::
{
    ; 定义 edge 的可执行文件路径
    edgePath := "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    if WinExist("ahk_exe msedge.exe")
    {
        WinActivate
    }
    else   {
        Run edgePath
    }
}

;;; 注册快捷键 `Ctrl+Alt+G` 用于打开 google 浏览器
^!g::
{
    ; 定义 google-chrome 的可执行文件路径
    chromePath := "C:\Program Files\Google\Chrome\Application\chrome.exe"
    if WinExist("ahk_exe chrome.exe")
    {
        WinActivate
    }
    else   {
        Run chromePath
    }
}

;;; 注册快捷键 `Ctrl+Alt+W` 用于打开 WeChat
^!w::
{
    ; 定义 WeChat 的可执行文件路径
    wechatPath := "D:\Program Files\WeChat\WeChat.exe"
    if WinExist("ahk_exe WeChat.exe")
    {
        WinActivate
    }
    else   {
        Run wechatPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+M` 用于打开 cmd
^!m::
{
    ; 定义 cmd 的可执行文件路径
    cmdPath := "C:\Windows\System32\cmd.exe"
    if WinExist("ahk_exe cmd.exe")
    {
        WinActivate
    }
    else   {
        Run cmdPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+K` 用于打开 alacritty
^!k::
{
    ; 定义 aracritty 的可执行文件路径
    alacrittyPath := "C:\Users\liyin\scoop\apps\alacritty\current\alacritty.exe"
    if WinExist("ahk_exe alacritty.exe")
    {
        WinActivate
    }
    else   {
        Run alacrittyPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+B` 用于打开 mintty
^!b::
{
    ; 定义 mintty 的可执行文件路径
    minttyPath := "c:\Users\liyin\scoop\shims\git-bash.exe"
    if WinExist("ahk_exe mintty.exe")
    {
        WinActivate
    }
    else   {
        Run minttyPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+P` 用于打开 powershell
^!p::
{
    ; 定义 powershell 的可执行文件路径
    powershellPath := "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
    if WinExist("ahk_exe powershell.exe")
    {
        WinActivate
    }
    else   {
        Run powershellPath
    }
}

;;; 注册快捷键 `Ctrl+Alt+N` 用于打开文件管理器
^!n::
{
    try
    {
        if WinExist("ahk_class CabinetWClass")
        {
           WinActivate
        }
        else
        {
           ; 指定要打开的文件夹路径
           folderPath := "C:\Users\liyin\Downloads"
           folderCmd := "C:\Windows\SysWOW64\explorer.exe "
           folderCmd_path := folderCmd . folderPath

           ; 打开文件夹
           Run folderCmd_path
        }
    }
    catch
    {
        MsgBox "未找到窗口。"
    }
}

;;; 注册快捷键 `Ctrl+Alt+S` 用于打开 localsend 应用
^!s::
{
    try
    {
        ; 定义 localSend 的可执行文件路径
        localSendPath := "D:\Program Files\LocalSend\localsend_app.exe"

        if WinExist("ahk_exe localsend_app.exe")
        {
            WinActivate
        }
        else   {
            Run localSendPath
        }
    }
    catch
    {
        MsgBox "未找到窗口。"
    }
}

;;; 对于当前激活 Emacs 来说, 使用 Capslock 键作为 Ctrl; Shift+Capslock 组合键作为切换大小写
{
    #HotIf WinActive("ahk_class Emacs")  ; if in emacs
    +Capslock::Capslock                   ; make shift+Caps-Lock the Caps Lock toggle
    Capslock::Control                     ; make Caps Lock the control button
    #HotIf                                ; end if in emacs
}

;;; 对于当前激活 office word 来说, 使用 emacs 的快捷键来操作一些指令
{
      ; 只在Word激活时启用Emacs快捷键
      #HotIf WinActive("ahk_class OpusApp")

      ;^X^F::Send "^o"          ; Ctrl+X Ctrl+F → 打开文件
      ;^X^S::Send "^s"          ; Ctrl+X Ctrl+S → 保存文件
      ;^X^W::Send "^+s"         ; Ctrl+X Ctrl+W → 另存为
      ;^X^C::Send "!{F4}"       ; Ctrl+X Ctrl+C → 退出Word
      ;^X^H::Send "^a"          ; Ctrl+X Ctrl+H → 全选

      ; Ctrl+X, Ctrl+F → 打开文件
      ^x::
      {
          ; 等待下一个按键
          CtrlC := Chr(3) ; Store the character for Ctrl-C in the CtrlC var
          ih := InputHook("L1 M")
          ih.Start()
          ih.Wait()
          if (ih.Input = CtrlC) {
             Send "!{F4}"       ; Ctrl+X Ctrl+C → 退出Word
          }
      }

      ; 光标移动
      ^F::Send "{Right}"       ; Ctrl+F → 向右移动 (forward)
      ^B::Send "{Left}"        ; Ctrl+B → 向左移动 (backward)
      ^N::Send "{Down}"        ; Ctrl+N → 向下移动 (next line)
      ^P::Send "{Up}"          ; Ctrl+P → 向上移动 (previous line)
      ^A::Send "{Home}"        ; Ctrl+A → 行首
      ^E::Send "{End}"         ; Ctrl+E → 行尾
      !F::Send "^{Right}"      ; Alt+F → 向前移动一个单词
      !B::Send "^{Left}"       ; Alt+B → 向后移动一个单词
      !<::Send "^{Home}"       ; Alt+< → 文档开头
      !>::Send "^{End}"        ; Alt+> → 文档结尾

      ; 编辑操作
      ^D::Send "{Delete}"      ; Ctrl+D → 删除右侧字符
      ^H::Send "{Backspace}"   ; Ctrl+H → 删除左侧字符
      !D::Send "^{Delete}"     ; Alt+D → 删除右侧单词
      ^K::                      ; Ctrl+K → 剪切到行尾
      {
          Send "{ShiftDown}{End}{ShiftUp}"
          Send "^x"
      }
      ^W::Send "^x"            ; Ctrl+W → 剪切选区
      !W::Send "^c"            ; Alt+W → 复制选区
      ^Y::Send "^v"            ; Ctrl+Y → 粘贴
      ^/::Send "^z"            ; Ctrl+/ → 撤销 (Emacs中通常是C-/或C-_)
      ^_::Send "^z"            ; Ctrl+_ → 撤销 (另一种Emacs风格)

      ; 搜索
      ^S::Send "^f"            ; Ctrl+S → 搜索
      ^R::Send "^h"            ; Ctrl+R → 替换
      ^G::                      ; Ctrl+G → 取消操作
      {
          if WinExist("查找和替换")
              Send "{Escape}"
          else
              Send "{Escape}"
      }

      ; 其他常用Emacs快捷键
      ^O::Send "{Enter}"       ; Ctrl+O → 插入新行

      ; 恢复默认的Word快捷键
      #HotIf
}
