.386
.model flat,stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc

.Data?

.Data

.Code

Dialog2Proc proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
	.IF uMsg==WM_DESTROY
		invoke PostQuitMessage,NULL
	.ELSEIF uMsg==WM_COMMAND
		mov eax,wParam
		.IF lParam==0
			; Process messages, else...
			invoke DestroyWindow,hWnd
		.ELSE
			mov edx,wParam
			shr edx,16
			; Process messages here
		.ENDIF
	.ELSE
		invoke DefWindowProc,hWnd,uMsg,wParam,lParam
		ret
	.ENDIF
	xor	eax,eax
	ret
Dialog2Proc endp

Button1Click proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
     ; Your code here
     xor eax, eax	; return false
     ret
Button1Click endp

end
