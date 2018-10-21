
package Helpers is

type Vector is array (Integer range <>) of Integer;
procedure Print_Vector(V: in Vector);
procedure Fill_With_Random_Values(V: in out Vector);
procedure Sort_Desc(V: in out Vector);
procedure Write_To_File(V: in out Vector);

end Helpers;