with Ada.Text_IO; use Ada.Text_IO;

procedure Main
is

   type Array_Type is array (Natural range <>) of Integer;

   function BinarySearch (Arr : Array_Type;
                          L   : Integer;
                          R   : Integer;
                          X   : Integer)
                          return Integer
   is
      Mid : Integer;
   begin
      if R >= 1 then
         Mid := L + (R - L) / 2;

         if Arr (Mid) = X then
            return Mid;
         elsif Arr (Mid) > X then
            return BinarySearch (Arr => Arr,
                                 L   => L,
                                 R   => Mid - 1,
                                 X   => X);
         else
            return BinarySearch (Arr => Arr,
                                 L   => Mid + 1,
                                 R   => R,
                                 X   => X);
         end if;
      end if;

      return -1;
   end BinarySearch;

   Arr : constant Array_Type := (1 => 2,
                                 2 => 4,
                                 3 => 5,
                                 4 => 6,
                                 5 => 8,
                                 6 => 10,
                                 7 => 13,
                                 8 => 16,
                                 9 => 20,
                                 10 => 33);

   Find : constant := 8;
   Result : Integer;
begin
   Result := BinarySearch (Arr => Arr,
                           L   => Arr'First,
                           R   => Arr'Last,
                           X   => Find);

   if Result < 0 then
      Put_Line ("Ada - Could not find " & Find'Img & " in list");
   else
      Put_Line ("Ada - Element " & Find'Img & " found at index " & Result'Img);
   end if;

end Main;
