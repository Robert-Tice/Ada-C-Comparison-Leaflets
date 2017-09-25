with System;

procedure Main is

   type Byte is mod 2 ** 8;
   type Byte_Array is array (Natural range <>) of Byte
     with Pack;

   type AODR_ENUM is
     (POWERDOWN, R12H5, R25H, R200H, R400H, R1600H)
     with Size => 4;

   for AODR_ENUM use
     (POWERDOWN => 2#0000#,
      R12H5     => 2#0011#,
      R25H      => 2#0100#,
      R200H     => 2#0111#,
      R400H     => 2#1000#,
      R1600H    => 2#1010#);

   type RegisterMap is record
      ZYXMDA   : Boolean := False;
      AODR     : AODR_ENUM := POWERDOWN;
      AXEN     : Boolean := True;
      AYEN     : Boolean := True;
      AZEN     : Boolean := True;
      Data     : Byte_Array (1 .. 4) := (others => 0);
   end record
     with Pack;

   for RegisterMap use record
      ZYXMDA at 0 range 0 .. 0;
      AODR at 0 range 1 .. 4;
      AXEN at 0 range 5 .. 5;
      AYEN at 0 range 6 .. 6;
      AZEN at 0 range 7 .. 7;
      Data at 1 range 0 .. 31;
   end record;

   Registers : RegisterMap
     with Address => System'To_Address (16#8000_0000#);

begin

   Registers.CTRL1.AODR := R400H;

   Registers.CTRL1.AXEN := True;
   Registers.CTRL1.AYEN := True;
   Registers.CTRL1.AZEN := True;

   loop
      if Registers.STATUS_M.ZYXMDA then
         null;
         --  do some stuff to read sensors
         delay 200.0;
      end if;
   end loop;

end Main;
