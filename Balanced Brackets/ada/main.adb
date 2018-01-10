with Ada.Text_IO; use Ada.Text_IO;

with Stack_Container;

procedure Main is

   MAXSIZE : constant := 100;

   function Is_Balanced (S : String) return Boolean
   is
      package Character_Stack is
        new Stack_Container (Max          => MAXSIZE,
                             Element_Type => Character);
      use Character_Stack;

      St : Stack;
      PP : Character;
   begin
      for I in S'Range loop
         case S (I) is
            when '{' | '[' | '(' =>
               St.Push (Data => S (I));
            when '}' | ']' | ')' =>
               if St.Is_Empty then
                  return False;
               else
                  if St.Peek = '{' and S (I) = '}' then
                     PP := St.Pop;
                  elsif St.Peek = '[' and S (I) = ']' then
                     PP := St.Pop;
                  elsif St.Peek = '(' and S (I) = ')' then
                     PP := St.Pop;
                  else
                     return False;
                  end if;
               end if;
            when others =>
               null;
         end case;
      end loop;

      return St.Is_Empty;
   end Is_Balanced;

   type String_Ptr is access all String;
   type String_List is array (Natural range <>) of String_Ptr;

   A : aliased String := "{[()]}";
   B : aliased String := "{[(])}";
   C : aliased String := "{{[[(())]]}}";
   D : aliased String := "((((((())";

   Msgs : constant String_List := (1 => A'Access,
                                   2 => B'Access,
                                   3 => C'Access,
                                   4 => D'Access);

begin
   for I in Msgs'Range loop
      if Is_Balanced (S => Msgs (I).all) then
         Put_Line ("Ada - YES");
      else
         Put_Line ("Ada - NO");
      end if;
   end loop;
end Main;
