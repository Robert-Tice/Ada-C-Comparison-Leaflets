with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Array_Type is array (Natural range <>) of Boolean;

   procedure Sieve (Arr : in out Array_Type)
   is
      Base : Positive := 2;
      Count : Positive;
   begin
      while Base * Base <= Arr'Last loop
         if Arr (Base) then
            Count := Base + Base;

            while Count <= Arr'Last loop
               Arr (Count) := False;
               Count := Count + Base;
            end loop;
         end if;
         Base := Base + 1;
      end loop;
   end Sieve;

   Last : constant := 100;
   V : Array_Type (1 .. Last) := (1      => False,
                                  others => True);
begin
   Put_Line ("Ada - Print all primes up to " & Last'Img);
   Sieve (Arr => V);
   for I in V'Range loop
      if V (I) then
         Put (I'Img &  " ");
      end if;
   end loop;

   Put_Line ("");
end Main;
