@set cnt=0

:loop

  @set /a cnt=%cnt%+1

  @account_info.py renenyffenegger

  @if %cnt% lss 100 goto loop

