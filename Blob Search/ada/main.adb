with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Grid_Type is array (Natural range <>, Natural range <>) of Integer;

   Grid : Grid_Type := ((1, 1, 0, 1, 0, 0, 1, 1),
                        (0, 1, 1, 0, 0, 0, 1, 1),
                        (0, 0, 0, 0, 0, 0, 0, 0),
                        (1, 1, 1, 1, 1, 1, 1, 1));

   function IsValid (X : Integer;
                     Y : Integer)
                     return Boolean
   is
     (X in Grid'Range (1) and then
      Y in Grid'Range (2) and then
      Grid (X, Y) >= 1);

   function Dfs (X : Integer;
                 Y : Integer)
                 return Natural
   is
      Count : Positive := 1;
      NewX  : Integer := X;
      NewY  : Integer := Y;
   begin
      if not IsValid (X => X,
                      Y => Y)
      then
         return 0;
      end if;

      Grid (X, Y) := -1;

      for I in -1 .. 1 loop
         for J in -1 .. 1 loop
            NewX := X + I;
            NewY := Y + J;

            Count := Count + Dfs (X => NewX,
                                  Y => NewY);
         end loop;
      end loop;

      return Count;

   end Dfs;

   MaxBlob, CurBlob : Natural := 0;
begin

   for I in Grid'Range (1) loop
      for J in Grid'Range (2) loop
         CurBlob := Dfs (I, J);

         if CurBlob > MaxBlob then
            MaxBlob := CurBlob;
         end if;
      end loop;
   end loop;

   Put_Line ("Ada - Max Blob size:" & MaxBlob'Img);

end Main;
