with Ada.Text_IO; use Ada.Text_IO;

procedure Main
is
   type Array_Type is array (Natural range <>) of Integer;

   procedure Swap (Arr : in out Array_Type;
                   X   : Natural;
                   Y   : Natural)
   is
      Temp : Integer := Arr (X);
   begin
      Arr (X) := Arr (Y);
      Arr (Y) := Temp;
   end Swap;

   procedure BubbleSort (Arr : in out Array_Type)
   is
   begin
      for I in Arr'First .. Arr'Last - 1 loop
         for J in Arr'First .. Arr'Last - I - 1 loop
            if Arr (J) > Arr (J + 1) then
               Swap (Arr => Arr,
                     X   => J,
                     Y   => J + 1);
            end if;
         end loop;
      end loop;
   end BubbleSort;

   procedure PrintArray (Arr : Array_Type)
   is
   begin
      for I in Arr'Range loop
         Put (Arr (I)'Img);
      end loop;
      New_Line (1);
   end PrintArray;

   Arr : Array_Type (1 .. 10) := (1  => 5,
                                  2  => 9,
                                  3  => 4,
                                  4  => 8,
                                  5  => 1,
                                  6  => 2,
                                  7  => 6,
                                  8  => 7,
                                  9  => 3,
                                  10 => 10);
begin
   BubbleSort (Arr => Arr);

   Put_Line ("Ada - Sorted array:");
   PrintArray (Arr => Arr);

end Main;
