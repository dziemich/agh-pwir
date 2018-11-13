with Ada.Text_IO,Ada.Numerics.Discrete_Random, Ada.Integer_Text_IO,Ada.Unchecked_Deallocation;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Lab4Lista is

type Element is
  record 
    Data : Integer := 0;
    Next : access Element := Null;
  end record; 

type Elem_Ptr is access all Element;

procedure Print(List : access Element) is
  L : access Element := List;
begin
  if List = Null then
    Put_Line("List EMPTY!");
  else
    Put_Line("List:"); 
  end if; 
  while L /= Null loop
    Put(L.Data, 4); -- z pakietu Ada.Integer_Text_IO
    New_Line;
    L := L.Next;
  end loop; 
end Print;

procedure Insert(List : in out Elem_Ptr; D : in Integer) is
  E : Elem_Ptr := new Element; 
begin
  E.Data := D;
  E.Next := List;
  List := E;
end Insert;

function Insert(List : access Element; D : in Integer) return access Element is 
  ( new Element'(D,List) ); 

procedure Insert_Sort(List : in out Elem_Ptr; D : in Integer) is 
El : access Element := List;
newEl : access Element := Null;
Tmp : access Element := Null;

begin
  while El /= Null loop
    if El.Next /= Null then
      if D <= El.Data then
        NewEl := (new Element'(El.Data, El) );
        El.Data := D;
        Tmp := El.Next;
        El.Next := NewEl;
        NewEl.Next := Tmp;
        exit;
      end if;
    else
      if D >= El.Data then
        NewEl := (new Element'(D, El) );
        El.Next := NewEl;
        NewEl.Next := Null;
        exit;
      else
        NewEl := (new Element'(El.Data, El) );
        El.Data := D;
        El.Next := NewEl;
        NewEl.Next := Null;
        exit;
      end if;
    end if;
    El := El.Next;
  end loop;
end Insert_Sort;

procedure Generate_Random_Numbers (List: in out Elem_Ptr; N: Integer; M: Integer) is 
  
  subtype Num_Type is Integer range 0 .. N;
  package Random_Num is new Ada.Numerics.Discrete_Random(Num_Type);
  use Random_Num;
  Rnd: Integer := 0;
  Gen: Generator; -- z pakietu Los_Znak 
begin
  Reset(Gen);
  for I in Integer range 1 .. M loop
  -- Put_Line(I'Img);
    Rnd := Random(Gen);
  if I = 1 then 
    Insert(List, Rnd);
  else
    Insert_Sort(List, Rnd);
  end if;
  end loop;
end Generate_Random_Numbers;

function Search (List : in Elem_Ptr; D : in Integer) return Boolean is 
Head : access Element := List;
begin 
  while Head /= Null loop
    if Head.Data = D then
      return True;
    end if;
  Head := Head.Next;  
  end loop;
  return False;
end Search;



procedure Delete (List : in out Elem_Ptr; D : in Integer) is
IsPresent: Boolean := False;
Head : access Element := List;
Prev : access Element := Null;
begin
IsPresent := Search(List, D);
  if IsPresent then 
    if List.Data = D then
      List := List.Next;
      Put_Line("D is Head");
    else
      while Head /= Null loop
          if Head.Data = D then
            Prev.Next := Head.Next; 
            exit;
          end if;
          Prev := Head;
          Head := Head.Next;  
        end loop;
      end if;
  else
    Put_Line("no item like that" & D'Img);
  end if;
end Delete;
Lista : Elem_Ptr := Null;

begin

  -- Generate_Random_Numbers(Lista, 100, 20);
  Insert(Lista, 21);
  Insert(Lista, 25);
  Print(Lista);
  Put_Line(Search(Lista, 22)'Img);
  Delete(Lista, 25);
  Delete(Lista, 31);
  Generate_Random_Numbers(Lista, )
  Print(Lista);

end Lab4Lista;
