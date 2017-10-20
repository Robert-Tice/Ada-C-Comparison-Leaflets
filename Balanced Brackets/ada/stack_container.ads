generic
   Max : Positive;
   type Index_Type is (<>);
package Stack_Container is

   type Index_Array is array (Natural range <>) of Index_Type;

   type Stack is tagged private;

   function IsEmpty (Self : Stack) return Boolean;
   function IsFull (Self : Stack) return Boolean;

   function Peek (Self : Stack) return Index_Type
     with Pre => not IsEmpty (Self => Self);

   function Size (Self : Stack) return Integer;

   function Pop (Self : in out Stack) return Index_Type
     with Pre => not IsEmpty (Self => Self),
     Post => Self.Size = Self.Size'Old - 1;

   procedure Push (Self : in out Stack;
                   Data : Index_Type)
     with Pre => not IsFull (Self => Self),
     Post => Self.Size = Self.Size'Old + 1;

private
   type Stack is tagged record
      Stk : Index_Array (1 .. Max);
      Top : Integer := 0;
   end record;

   function Size (Self : Stack) return Integer is
      (Self.Top);

   function Peek (Self : Stack) return Index_Type is
     (Self.Stk (Self.Top));

   function IsFull (Self : Stack) return Boolean is
     (Self.Top = Self.Stk'Last);

   function IsEmpty (Self : Stack) return Boolean is
     (Self.Top < Self.Stk'First);

end Stack_Container;
