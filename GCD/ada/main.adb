with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Intmod is mod 2 ** 32;

   function Gcd (A : Intmod;
                 B : Intmod)
                 return Intmod
   is
   begin
      if A = 0 then
         return B;
      end if;

      return Gcd (A => B mod A,
                  B => A);
   end Gcd;

   A : Intmod := 10;
   B : Intmod := 15;
   C : Intmod;
begin
   C := Gcd (A => A,
             B => B);
   Put_Line ("Ada - gcd of " & A'Img & " and " & B'Img & " is " & C'Img);
end Main;
