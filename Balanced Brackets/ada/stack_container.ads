generic
   Max : Positive;
   type Element_Type is private;
package Stack_Container is

   type Stack is limited private;

   function Is_Empty (Self : Stack) return Boolean;

   function Is_Full (Self : Stack) return Boolean;

   function Peek (Self : Stack) return Element_Type
     with Pre => not Is_Empty (Self);

   function Size (Self : Stack) return Natural;

   procedure Pop (Self : in out Stack; Data : out Element_Type)
     with Pre  => not Is_Empty (Self),
          Post => not Is_Full (Self) and
                  Size (Self) = Size (Self)'Old - 1 and
                  Data = Peek (Self)'Old;

   procedure Pop (Self : in out Stack)
     with Pre  => not Is_Empty (Self),
          Post => not Is_Full (Self) and
                  Size (Self) = Size (Self)'Old - 1;

   procedure Push (Self : in out Stack;
                   Data : Element_Type)
     with Pre  => not Is_Full (Self),
          Post => not Is_Empty (Self) and
                  Size (Self) = Size (Self)'Old + 1 and
                  Data = Peek (Self);

private

   type Element_Values is array (Natural range <>) of Element_Type;

   type Stack is record
      Content : Element_Values (1 .. Max);
      Top     : Natural := 0;
   end record;

   function Size (Self : Stack) return Natural is
      (Self.Top);

   function Peek (Self : Stack) return Element_Type is
     (Self.Content (Self.Top));

   function Is_Full (Self : Stack) return Boolean is
     (Self.Top = Self.Content'Last);

   function Is_Empty (Self : Stack) return Boolean is
     (Self.Top < Self.Content'First);

end Stack_Container;
