with Ada.Text_IO,Ada.Numerics.Discrete_Random, Ada.Float_Text_IO;
use Ada.Text_IO,Ada.Float_Text_IO;

package body Helpers is

procedure Print_Vector(V: in Vector) is 
begin
for E of V loop
  Put_Line(E'Img);
  end loop;
end Print_Vector;

procedure Fill_With_Random_Values(V: in out Vector) is
  
  package Los_Liczby is new Ada.Numerics.Discrete_Random(Integer);
  use Los_Liczby;

  Gen: Generator; -- z pakietu Los_Znak 
begin
  Reset(Gen);
  for E of V loop
    E := Random(Gen);
  end loop;
end Fill_With_Random_Values;


procedure Sort_Desc (V: in out Vector) is
tmp: Integer := V'First;
begin
for E1 of V loop
  for E2 of V loop
    if E1>=E2 then
      tmp := E1;
      E1 := E2;
      E2 := tmp;
      end if;
    end loop;
  end loop;
end Sort_Desc;

procedure Write_To_File (V: in out Vector) is
fd : File_Type;
  Name: String := "vector.txt";
begin
Create(fd, Out_File, Name);
for I of V loop
	Put_Line(fd, I'Img);
  end loop;	   
end Write_To_File;

end Helpers;