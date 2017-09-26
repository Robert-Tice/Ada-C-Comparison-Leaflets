generic
   Max : Positive;
   type Index_Type is (<>);
package Stack_Container is

   type Index_Array is array (Natural range <>) of Index_Type;

   type Stack is tagged record
      Stk : Index_Array (1 .. Max);
      Top : Integer := 0;
   end record;
   
   function IsEmpty (Self : Stack) return Boolean is
     (Self.Top < Self.Stk'First);

   function IsFull (Self : Stack) return Boolean is
     (Self.Top = Self.Stk'Last);
    
   function Peek (Self : Stack) return Index_Type is
     (Self.Stk (Self.Top));

   function Pop (Self : in out Stack) return Index_Type
     with Pre => not IsEmpty (Self => Self),
     Post => Self.Top = Self.Top'Old - 1;
  
   procedure Push (Self : in out Stack;
                   Data : Index_Type)
     with Pre => not IsFull (Self => Self),
     Post => Self.Top = Self.Top'Old + 1;
   

end Stack_Container;
