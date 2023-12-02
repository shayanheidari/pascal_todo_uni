
Program ToDoList;

Uses functions, sysutils, strutils, Crt;


Var user_action, todo : string;
  todos: array Of string;
  i, n, highh: integer;
  f: Text;

Procedure DeleteX(n:integer);
(* a procedure to delete a element in todos array*)
Begin
  highh := High(todos);
  For i := (n-1) To highh - 1 Do
    todos[i] := todos[i + 1];

  SetLength(todos, highh);
End;

Begin
  ClrScr;
  If Not FileExists('todo.txt') Then
    // create a todo.txt file if it doesn't exist in main directory
    Begin
      Assign(f, 'todo.txt');
      rewrite(f);
    End;
  Assign(f, 'todo.txt');
  // load todo.txt to f
  reset(f);
  // opens f
  While Not (EoF(f)) Do
    // read it until it's done
    Begin
      readln(f, todo);
      // reads lines from f
      SetLength(todos, Length(todos) + 1);
      // allocate memory for todos array
      todos[High(todos)] := todo;
      // assing todo to the last element of todos array
    End;

  rewrite(f);
  // delete contents of f


  writeln('--->');
  writeln('--- ', Greating(),' | ' ,TimeToStr(time));
  writeln('--->');
  writeln;
  While True Do
    Begin
      write('Type add, edit, show, complete or exit: ');
      Readln(user_action);
      If StartsStr('add', user_action) Then
        Begin

          write('add a todo: ');
          readln(todo);
          SetLength(todos, Length(todos) + 1);
          // increase the size of todos array by one
          todos[High(todos)] := todo;
          writeln;
        End
      Else If StartsStr('edit', user_action) Then
             Begin
               write('enter the number of todo that you want to edit: ');
               readln(n);
               write('enter the new todo: ');
               readln(todo);
               writeln;
               todos[n-1] := todo;
               // replace the old todo with the new one
             End
      Else If StartsStr('show', user_action) Then
             Begin
               writeln;
               For i:=low(todos) To high(todos) Do
                 // enumerate the list for numbered presentation
                 writeln(i+1, ' - ', todos[i]);
               writeln;
             End
      Else If StartsStr('complete', user_action) Then
             Begin
               write('enter the number of todo you want to check complete: ');
               readln(n);
               // read the number of element that is need to be deleted
               DeleteX(n);
               // delete the element in todos array
               writeln;
             End
      Else If StartsStr('exit', user_action) Then break;
      // break the while loop if user_action is 'exit'
    End;
  writeln;
  writeln('hava a good day!');


  For i:=low(todos) To high(todos) Do
    writeln(f,todos[i]);
  close(f);
  // saving and closing the todo.txt file

  writeln;


End.
