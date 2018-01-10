package body Stack_Container is

   ---------
   -- Pop --
   ---------

   function Pop (Self : in out Stack) return Element_Type is
      Data : Element_Type;
   begin
      Data := Self.Peek;
      Self.Top := Self.Top - 1;
      return Data;
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
      Self.Stk (Self.Top) := Data;
   end Push;

end Stack_Container;
