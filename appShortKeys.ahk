#Requires AutoHotkey v2.0

; 注册快捷键 `Ctrl+Alt+A` 用于 Flameshot 截图
^!a::
{
    Send("{PrintScreen}")  ; 模拟按下 Print Screen 键
}

; 用于打开 emacs
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

; 用于打开 edge 浏览器
^!f::
{
    ; 定义 Emacs 的可执行文件路径
    edgePath := "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    if WinExist("ahk_exe msedge.exe")
    {
        WinActivate
    }
    else   {
        Run edgePath
    }
}

; 用于关闭当前光标所在 app
^!c::
{
    MouseGetPos , , &id, &control
    ; 关闭该窗口
    WinClose id
}

; 用于最大化/正常化光标下激活的窗口
^+f::
{
    MouseGetPos , , &id, &control
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

; 用于恢复正常化窗口
^+r::
{
    MouseGetPos , , &id, &control
    WinRestore id
}

; 用于模拟发送 Win+d 按键，用于显示桌面
^!d::
{
      Send("#d")
}

; 用于打开文件管理器
^!n::
{
    try
    {
        ; 指定要打开的文件夹路径
        folderPath := "D:\"
        folderCmd := "C:/Windows/SysWOW64/explorer.exe "
        folderCmd_path := folderCmd . folderPath
        ; 打开文件夹
        Run folderCmd_path
    }
    catch
    {
        MsgBox "未找到窗口。"
    }

}

; 用于打开 localsend 应用
^!s::
{
    try
    {
        ; 定义 localSend 的可执行文件路径
        localSendPath := "D:\Program Files\LocalSend\localsend_app.exe"

        ; 检查 Emacs 是否已经运行
        if WinExist("ahk_exe localsend_app.exe")
        {
            ; 如果 Emacs 已经运行，则激活窗口
            WinActivate
        }
        else   {
            ; 如果 Emacs 没有运行，则启动 Emacs
            Run localSendPath
        }
    }
    catch
    {
        MsgBox "未找到窗口。"
    }
}
