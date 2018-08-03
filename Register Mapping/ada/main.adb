with System;
with Ada.Real_Time;  use Ada.Real_Time;

procedure Main is

   type Byte is mod 2 ** 8;

   type Byte_Array is array (Natural range <>) of Byte
     with Component_Size => 8;

   type AODR_ENUM is (POWERDOWN, R12H5, R25H, R200H, R400H, R1600H)
     with Size => 4;

   for AODR_ENUM use
     (POWERDOWN => 2#0000#,
      R12H5     => 2#0011#,
      R25H      => 2#0100#,
      R200H     => 2#0111#,
      R400H     => 2#1000#,
      R1600H    => 2#1010#);

   type Register_Map is record
      ZYXMDA   : Boolean;
      AODR     : AODR_ENUM;
      AXEN     : Boolean;
      AYEN     : Boolean;
      AZEN     : Boolean;
      Data     : Byte_Array (1 .. 4);
   end record;

   for Register_Map use record
      ZYXMDA at 0 range 0 .. 0;
      AODR   at 0 range 1 .. 4;
      AXEN   at 0 range 5 .. 5;
      AYEN   at 0 range 6 .. 6;
      AZEN   at 0 range 7 .. 7;
      Data   at 1 range 0 .. 31;
   end record;

   Registers : Register_Map with
     Size    => 40,  -- bits
     Address => System'To_Address (16#8000_0000#);

   Period       : constant Time_Span := Milliseconds (200);
   Next_Release : Time := Clock;

begin
   Registers.Data := (others => 0);

   Registers.AODR := R400H;

   Registers.AXEN := True;
   Registers.AYEN := True;
   Registers.AZEN := True;

   loop
      if Registers.ZYXMDA then
         --  do some stuff to read sensors

         Next_Release := Next_Release + Period;
         delay until Next_Release;
      end if;
   end loop;
end Main;
