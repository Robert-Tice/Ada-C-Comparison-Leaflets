with Ada.Text_IO; use Ada.Text_IO;

with Stack_Container;

procedure Main is

   Max_Stack_Size : constant := 100;

   package Characters is
     new Stack_Container (Max          => Max_Stack_Size,
                          Element_Type => Character);
   use Characters;

   function Is_Balanced (Input : String) return Boolean is
      Chars     : Characters.Stack;
      Prev_Char : Character;
   begin
      for Next_Char of Input loop
         case Next_Char is
            when '{' | '[' | '(' =>
               Push (Chars, Next_Char);
            when '}' | ']' | ')' =>
               if Is_Empty (Chars) then
                  return False;
               else
                  Prev_Char := Peek (Chars);
                  if Prev_Char = '{' and Next_Char = '}' then
                     Pop (Chars);
                  elsif Prev_Char = '[' and Next_Char = ']' then
                     Pop (Chars);
                  elsif Prev_Char = '(' and Next_Char = ')' then
                     Pop (Chars);
                  else
                     return False;
                  end if;
               end if;
            when others =>
               null;
         end case;
      end loop;

      return Is_Empty (Chars);
   end Is_Balanced;

   type String_Ptr is access constant String;
   type String_List is array (Natural range <>) of String_Ptr;

   A : aliased constant String := "{[()]}";
   B : aliased constant String := "{[(])}";
   C : aliased constant String := "{{[[(())]]}}";
   D : aliased constant String := "((((((())";

   Msgs : constant String_List := (1 => A'Access,
                                   2 => B'Access,
                                   3 => C'Access,
                                   4 => D'Access);

begin
   for Next_String of Msgs loop
      if Is_Balanced (Next_String.all) then
         Put_Line ("Ada - YES");
      else
         Put_Line ("Ada - NO");
      end if;
   end loop;
end Main;
