with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   Eps : constant := Pi / 2.0 ** 15;
   type Radians is delta Eps range -Pi .. Pi - Eps   --  internal rep 16 bit
     with Small => Eps;                                 --  signed integer

   D : Radians := Radians'First;
begin

   while D < Radians'Last loop
      Put_Line (D'Img & " ");
      D := Radians'Succ (D);
   end loop;

end Main;
