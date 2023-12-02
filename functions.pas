
Unit functions;

Interface
Function Greating(): string;

Implementation

Uses sysutils;
Function Greating(): string;
{
    This function will return a greating based on your computer time
}

Var hr, min, sec, ms : Word;
Begin
  DecodeTime(Time, hr, min, sec, ms);
  If (12 >= hr) And (hr > 6) Then Greating := 'Good Morning'
  Else If (16 >= hr) And (hr > 12) Then Greating := 'Good Afternoon'
  Else Greating := 'Good night';

End;

End.
