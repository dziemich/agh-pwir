
with Ada.Text_IO, Helpers, Ada.Calendar;
use Ada.Text_IO, Helpers, Ada.Calendar;

procedure Lab2 is
  -- type Vector is array (Integer range <>) of Integer;
  V1: Vector(1 .. 10_000);
  T1, T2: Time;
  D: Duration;


function Check_If_Sorted_Ascending (V: in out Helpers.Vector) return Boolean is
(for all I in V'First..(V'Last-1) => V(I)<=V(I+1)); 

begin
  V1 := (others => 0);
  T1:= Clock;
  Fill_With_Random_Values(V1);
  Sort_Desc(V1);
  Write_To_File(V1);
  T2:= Clock;
  D:= T2 - T1;
  Put_Line("Duration: " & D'Img);
end Lab2;