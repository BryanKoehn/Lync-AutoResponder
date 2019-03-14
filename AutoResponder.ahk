#Persistent

Cell = 651.555.1212

Gui +LastFound
hWnd := WinExist()

DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return

ShellMessage( wParam,lParam ) {
  Local k
  If ( wParam = 1 ) ;  HSHELL_WINDOWCREATED := 1
     {
       NewID := lParam
       SetTimer, MsgBox, -1
     }
}

MsgBox:
 WinGetTitle, Title, ahk_id %NewID%
 WinGetClass, Class, ahk_id %NewID%
; TrayTip, New Window Opened, Title:`t%Title%`nClass:`t%Class%

If Class = LyncConversationWindowClass
{
  WinActivate, %Title%

  If (A_Hour > 8 && A_Hour < 17){
   Random, RandomResponse, 1, 11
   If RandomResponse = 1
     Send, Just stepped out, shoot me an email or call my cell and I'll get back ASAP. %Cell% {Enter}
   If RandomResponse = 2
     Send, Away from my desk use my cell if you need immediate assistance.  %Cell% {Enter}
   If RandomResponse = 3
     Send, Stepped out, email me or call my cell.  %Cell% {Enter}
   If RandomResponse = 4
     Send, Call the cell, stepped out.  %Cell% {Enter}
   If RandomResponse = 5
     Send, Use my cell I'm not at my desk... %Cell% {Enter}
   If RandomResponse = 6
     Send, I'm not here at the moment Call me if it's urgent... %Cell% {Enter}
   If RandomResponse = 7
     Send, Walked out, if it's urgent call my cell ... %Cell% {Enter}
   If RandomResponse = 8
     Send, Not at my desk, call my cell if it's urgent.  %Cell% {Enter}
   If RandomResponse = 9
     Send, Not at my desk, use my cell if it's urgent. %Cell%{Enter}
   If RandomResponse = 10
     Send, Stepped away, use my cell if it's urgent.  %Cell%{Enter}
   If RandomResponse = 11
     Send, Email me or call my cell I'm not at my desk.  %Cell%{Enter}

  }Else{
   Random, RandomResponse, 1, 7
   If RandomResponse = 1
     Send, I'm not at my desk at the moment, try emailing me. {Enter}
   If RandomResponse = 2
     Send, Shoot me an email, I'm not at my desk at the moment. {Enter}
   If RandomResponse = 3
     Send, I gotta catch up on some stuff, shoot me an email I'll follow up as soon as I can. {Enter}
   If RandomResponse = 4
     Send, Shoot me an email, I need to walk away.{Enter}
   If RandomResponse = 5
     Send, I'm just stepping away. {Enter}
   If RandomResponse = 6
     Send, I've got to run, let's catch up later. {Enter}
   If RandomResponse = 7
     Send, I gotta catch up on some stuff, shoot me an email I'll follow up as soon as I can. {Enter}

  }
}
Return
