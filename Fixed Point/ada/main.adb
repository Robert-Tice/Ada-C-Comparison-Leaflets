with Ada.Numerics; use Ada.Numerics;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Radians is delta 0.001 range -Pi .. Pi          --  internal rep 16 bit
     with Small => (Pi/2.0**15);                       --  signed integer

   D : Radians := Radians'First;
begin

   while D < Radians'Last loop
      Put_Line (D'Img & " ");
      D := Radians'Succ(D);
   end loop;

end Main;
