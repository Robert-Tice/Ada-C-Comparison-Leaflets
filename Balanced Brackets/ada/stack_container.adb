package body Stack_Container is

   ---------
   -- Pop --
   ---------

   procedure Pop (Self : in out Stack) is
   begin
      Self.Top := Self.Top - 1;
   end Pop;


   ---------
   -- Pop --
   ---------

   procedure Pop (Self : in out Stack; Data : out Element_Type) is
   begin
      Data := Self.Content (Self.Top);
      Self.Top := Self.Top - 1;
   end Pop;

   ----------
   -- Push --
   ----------

   procedure Push
     (Self : in out Stack;
      Data : Element_Type)
   is
   begin
      Self.Top := Self.Top + 1;
      Self.Content (Self.Top) := Data;
   end Push;

end Stack_Container;
