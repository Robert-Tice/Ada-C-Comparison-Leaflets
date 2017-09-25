generic
   Max : Positive;
   type Index_Type is (<>);
package Stack_Container is

   type Index_Array is array (Natural range <>) of Index_Type;

   type Stack is tagged record
      Stk : Index_Array (1 .. Max);
      Top : Integer := 1;
   end record;
   
   function IsEmpty (Self : Stack) return Boolean is
     (Self.Top < Self.Stk'First);

   function IsFull (Self : Stack) return Boolean is
     (Self.Top = Self.Stk'Last);

   Full_Exception, Empty_Exception : exception;
    
   function Peek (Self : Stack) return Index_Type is
     (Self.Stk (Self.Top));

   function Pop (Self : in out Stack) return Index_Type;
  
   procedure Push (Self : in out Stack;
                   Data : Index_Type);
   

end Stack_Container;
