generic
   Max : Positive;
   type Element_Type is (<>);
package Stack_Container is

   type Stack is tagged private;

   function IsEmpty (Self : Stack) return Boolean;
   function IsFull (Self : Stack) return Boolean;

   function Peek (Self : Stack) return Element_Type
     with Pre => not IsEmpty (Self => Self);

   function Size (Self : Stack) return Natural;

   function Pop (Self : in out Stack) return Element_Type
     with Pre => not IsEmpty (Self => Self),
     Post => Self.Size = Self.Size'Old - 1;

   procedure Push (Self : in out Stack;
                   Data : Element_Type)
     with Pre => not IsFull (Self => Self),
     Post => Self.Size = Self.Size'Old + 1;

private
   type Element_Array is array (Natural range <>) of Element_Type;

   type Stack is tagged record
      Stk : Element_Array (1 .. Max);
      Top : Integer := 0;
   end record;

   function Size (Self : Stack) return Natural is
      (Self.Top);

   function Peek (Self : Stack) return Element_Type is
     (Self.Stk (Self.Top));

   function IsFull (Self : Stack) return Boolean is
     (Self.Top = Self.Stk'Last);

   function IsEmpty (Self : Stack) return Boolean is
     (Self.Top < Self.Stk'First);

end Stack_Container;
