#Requires AutoHotkey v2.0

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

;;; 注册快捷键 `Ctrl+Alt+K` 用于打开 cmd
^!k::
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
           folderPath := "D:\"
           folderCmd := "C:/Windows/SysWOW64/explorer.exe "
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
