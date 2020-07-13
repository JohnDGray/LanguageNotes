(*-------------------------Elements of ML Programming-------------------------*)
(*-------------------------------Chapter-2------------------------------------*)
(* Getting Started in ML *)

0 - 5;
(* val it = ~5 : int *)

~1234;
(* val it = ~1234 : int *)

"foo"
(* = val it = "foo" : string *)

#"x";
(* val it = #"x" : char *)

(*----------------------------------------------------------------------------*)

10.0 / 3.0;
(* val it = 3.33333333333 : real *)

10 div 3;
(* val it = 3 : int *)

10 mod 3;
(* val it = 1 : int *)

(*----------------------------------------------------------------------------*)

"house" ^ "cat";
(* val it = "housecat" : string *)

(*----------------------------------------------------------------------------*)

if ~5<2 then "negative five" else "two";
(* val it = "negative five" : string *)

if 1<2 andalso 3<4 then "yes" else "no";
(* val it = "yes" : string *)

if 5<2 orelse 3<4 then "yes" else "no";
(* val it = "yes" : string *)

if 3=3 then "yes" else "no";
(* val it = "yes" : string *)

if not(3=3) then "yes" else "no";
(* val it = "no" : string *)

if 3<>2 then "yes" else "no";
(* val it = "yes" : string *)

if 3<>4 then "yes" else "no";
(* val it = "yes" : string *)

if 3<>3 then "yes" else "no";
(* val it = "no" : string *)

(*----------------------------------------------------------------------------*)

val pi = 3.14159;
(* val pi = 3.14159 : real *)

pi + 5.0;
(* val it = 8.14159 : real *)

pi + 5;
(* stdIn:7.1-7.7 Error: operator and operand don't agree [overload conflict] *)
(*   operator domain: real * real                                            *)
(*   operand:         real * [int ty]                                        *)
(*   in expression:                                                          *)
(*     pi + 5                                                                *)

(*----------------------------------------------------------------------------*)

val t = (4,5.0,"six");
(* val t = (4,5.0,"six") : int * real * string *)

#1(t);
(* val it = 4 : int *)

(*----------------------------------------------------------------------------*)

[];
(* val it = [] : 'a list *)

val l = [1,2,3];
(* val l = [1,2,3] : int list *)

hd(l);
(* val it = 1 : int *)

tl(l);
(* val it = [2,3] : int list *)

[1,2]@[3,4];
(* val it = [1,2,3,4] : int list *)

2::[3,4];
(* val it = [2,3,4] : int list *)

(*----------------------------------------------------------------------------*)

explode("abc");
(* val it = [#"a",#"b",#"c"] : char list *)

implode([#"a",#"b",#"c"]);
(* val it = "abc" : string *)

concat(["ab","cd","e"]);
(* val it = "abcde" : string *)
 

(*-------------------------------Chapter-3------------------------------------*)
(* Defining Functions *)

fun square(x:real) = x*x;
(* val square = fn : real -> real *)

fun max3(a:real, b, c) =
  if a>b then
    if a>c then a
    else c
  else
      if b>c then b
      else c;
(* val max3 = fn : real * real * real -> real *)

fun 
  take(L) =
    if L = nil then nil
    else hd(L)::skip(tl(L))
and
  skip(L) =
    if L = nil then nil
    else take(tl(L));
(* val take = fn : ''a list -> ''a list *)
(* val skip = fn : ''a list -> ''a list *)

(*----------------------------------------------------------------------------*)

fun reverse(nil) = nil
|   reverse(x::xs) = reverse(xs) @ [x];
(* val reverse = fn : 'a list -> 'a list *)

fun merge(nil, M) = M
|   merge(L, nil) = L
|   merge(L as x::xs, M as y::ys) = 
      if x < y then x::merge(xs, M)
      else y::merge(L, ys);
(* val merge = fn : int list * int list -> int list *)

fun sumPairs(nil) = 0
|   sumPairs((x, y)::zs) = x + y + sumPairs(zs);
(* val sumPairs = fn : (int * int) list -> int *)

fun hundredthPower(x:real) =
let
  val four = x*x*x*x;
  val twenty = four*four*four*four;
in
  twenty*twenty*twenty*twenty*twenty
end;
(* val hundredthPower = fn : real -> real *)

fun split(nil) = (nil,nil)
|   split([a]) = ([a], nil)
|   split(a::b::cs) = 
      let
        val (M,N) = split(cs)
      in
        (a::M, b::N)
      end;
(* val split = fn : 'a list -> 'a list * 'a list *)

fun mergeSort(nil) = nil
|   mergeSort([a]) = [a]
|   mergeSort(L) =
      let
        val (M,N) = split(L);
        val M = mergeSort(M);
        val N = mergeSort(N);
      in
        merge(M,N)
      end;
(* val mergeSort = fn : int list -> int list *)

fun rev1(nil, M) = M
|   rev1(x::xs, ys) = rev1(xs, x::ys);
(* val rev1 = fn : 'a list * 'a list -> 'a list *)

fun reverse(L) = rev1(L, nil)
(* val reverse = fn : 'a list -> 'a list *)

(*-------------------------------Chapter-4------------------------------------*)
(* Input and Output *)

print("hello\n")
(* hello *)

fun printList(nil) = ()
|   printList(x::xs) = (
      print(Int.toString(x));
      print("\n");
      printList(xs)
    );
(* val printList = fn : int list -> unit *)

(*----------------------------------------------------------------------------*)

val infile = TextIO.openIn("myfile.txt");
(* val infile = - : TextIO.instream *)

fun makeList1(infile, NONE) = nil
|   makeList1(infile, SOME c) =
      c::makeList1(infile, TextIO.input1(infile));
(* val makeList1 = fn : TextIO.instream * TextIO.elem option -> TextIO.elem list *)

fun makeList(infile) = makeList1(infile, TextIO.input1(infile));
(* val makeList = fn : TextIO.instream -> TextIO.elem list *)

(*----------------------------------------------------------------------------*)

(* alternatively... *)
fun makeList1(infile, c) =
  if isSome(c) then
    valOf(c)::makeList1(infile, TextIO.input1(infile))
  else nil;
(* val makeList1 = fn : TextIO.instream * TextIO.elem option -> TextIO.elem list *)

(*-------------------------------Chapter-5------------------------------------*)
(* More About Functions *)

fun reverse(nil) = nil
|   reverse(x::xs) = reverse(xs) @ [x]
(* = val reverse = fn : 'a list -> 'a list *)

(* equivalently... *)
val rec reverse = fn   (* 'rec' is necessary since the function is recursive *)
  nil => nil  |
  x::xs => reverse(xs) @ [x];
(* val reverse = fn : 'a list -> 'a list *)

(*----------------------------------------------------------------------------*)

(fn x => x + 1)(3);
(* val it = 4 : int *)

(*----------------------------------------------------------------------------*)

if 1<2 then #"a" else #"b"
(* = val it = #"a" : char *)

(* equivalently... *)
case 1<2 of
    true => #"a" |
    false => #"b"
(* = val it = #"a" : char *)

(*----------------------------------------------------------------------------*)

exception Foo;
(* exception Foo *)

raise Foo
(* uncaught exception Foo *)

exception Foo of string;
(* exception Foo of string *)

raise Foo("bar")
(* uncaught exception Foo *)
(*   raised at: stdIn:4.7-4.17 *)

(*----------------------------------------------------------------------------*)

exception OutOfRange of int * int;
(* exception OutOfRange of int * int *)

(* calculate 'n choose m', which is n!/(m!(n-m)!) *)
fun comb1(n, m) =
  if n <= 0 then raise OutOfRange(n, m)
  else if m < 0 orelse m > n then
    raise OutOfRange(n, m)
  else if m = 0 orelse m = n then 1
  else comb1(n-1, m) + comb1(n-1, m-1);
(* val comb1 = fn : int * int -> int *)

fun comb(n, m) = comb1(n, m) handle
  OutOfRange(0, 0) => 1 |
  OutOfRange(n, m) => (
    print("out of range: n=");
    print(Int.toString(n));
    print(" m=");
    print(Int.toString(m));
    print("\n");
    0
    );
(* val comb = fn : int * int -> int *)

(*----------------------------------------------------------------------------*)

fun simpleMap(F, nil) = nil
|   simpleMap(F, x::xs) = F(x)::simpleMap(F, xs);
(* = val simpleMap = fn : ('a -> 'b) * 'a list -> 'b list *)

fun square(x:real) = x*x;
(* val square = fn : real -> real *)

simpleMap(square, [1.0, 2.0, 3.0]);
(* val it = [1.0,4.0,9.0] : real list *)

(* equivalently... *)
simpleMap(fn x => x*x, [1.0, 2.0, 3.0]);
(* val it = [1.0,4.0,9.0] : real list *)

exception EmptyList;
(* exception EmptyList *)

fun reduce(F, nil) = raise EmptyList
|   reduce(F, [a]) = a
|   reduce(F, x::xs) = F(x, reduce(F, xs));
(* val reduce = fn : ('a * 'a -> 'a) * 'a list -> 'a *)

(* 'op +' is necessary when passing the + operator as a function *)
fun variance(L) =
  let
    val n = real(length(L))
  in
    reduce(op +, simpleMap(square, L))/n - square(reduce(op +, L)/n)
  end;
(* val variance = fn : real list -> real *)

(*----------------------------------------------------------------------------*)

fun f(x, y) = x + y;
(* val f = fn : int * int -> int *)

(* also possible is... *)
fun f x y = x + y;
(* val f = fn : int -> int -> int *)

(* but notice the different signatures *)

(*----------------------------------------------------------------------------*)

fun F(x) = x+3;
(* val F = fn : int -> int *)

fun G(y) = y*y + 2*y;
(* val G = fn : int -> int *)

val H  = G o F;
(* val H = fn : int -> int *)

H(10);
(* val it = 195 : int *)

(*-------------------------------Chapter-6------------------------------------*)
(* Defining Your Own Types *)

type signal = real list;
(* type signal = real list *)

val v = [1.0, 2.0] : signal;
(* val v = [1.0,2.0] : signal *)

type ('d, 'r) mapping = ('d * 'r) list;
(* type ('a,'b) mapping = ('a * 'b) list *)

(*----------------------------------------------------------------------------*)

datatype fruit = Apple | Pear | Grape;

(*----------------------------------------------------------------------------*)

datatype ('a, 'b) element =
  P of 'a * 'b  |
  S of 'a;
(* datatype ('a,'b) element = P of 'a * 'b | S of 'a *)

fun sumElList(nil) = 0
|   sumElList(S(x)::L) = sumElList(L)
|   sumElList(P(x, y)::L) = y + sumElList(L);
(* val sumElList = fn : ('a,int) element list -> int *)

sumElList [P("in", 6), S("function"), P("as", 2)];
(* val it = 8 : int *)

(*----------------------------------------------------------------------------*)

datatype 'label btree =
  Empty  |
  Node of 'label * 'label btree * 'label btree;
(* datatype 'a btree = Empty | Node of 'a * 'a btree * 'a btree      *)

Node("as", Node("a", Empty, Empty), Node("in", Empty, Empty));
(* val it = Node ("as",Node ("a",Empty,Empty),Node ("in",Empty,Empty))     *)
(*   : string btree     *)

datatype
  'label evenTree = Empty  |
    Enode of 'label * 'label oddTree * 'label oddTree
and
  'label oddTree =
    Onode of 'label * 'label evenTree * 'label evenTree;
(* datatype 'a evenTree = Empty | Enode of 'a * 'a oddTree * 'a oddTree *)
(* datatype 'a oddTree = Onode of 'a * 'a evenTree * 'a evenTree *)

val t1 = Onode(1, Empty, Empty);
(* val t1 = Onode (1,Empty,Empty) : int oddTree *)

val t2 = Onode(2, Empty, Empty);
(* val t2 = Onode (2,Empty,Empty) : int oddTree *)

val t3 = Enode(3, t1, t2);
(* val t3 = Enode (3,Onode (1,Empty,Empty),Onode (2,Empty,Empty)) : int evenTree *)

(*-------------------------------Chapter-7------------------------------------*)
(* More About ML Data Structures *)

val Norm'sRecord = {
  ID = 123,
  name = "Norm dePlume",
  courses = ["CS106X", "E40", "M43"]
};
(* val Norm'sRecord = {ID=123,courses=["CS106X","E40","M43"],name="Norm dePlume"} *)
(*   : {ID:int, courses:string list, name:string} *)

#name(Norm'sRecord);
(* val it = "Norm dePlume" : string *)

exception NotFound;

fun getID(person, nil) = raise NotFound
|   getID(person, (x as {name=p,...})::xs) =
      if p = person then
        #ID(x:{name:string, ID:int, courses:string list})
      else getID(person, xs);
(* val getID = fn                                                      *)
(*   : string * {ID:int, courses:string list, name:string} list -> int *)

fun tuition({name = _, ID = _, courses = nil}) = 1000
|   tuition({courses=[ _ ], ...}) = 2000
|   tuition({ID=i,...}) =
      if i>=100000 then 5000
      else 4000;
(* val tuition = fn : {ID:int, courses:'a list, name:'b} -> int *)

tuition(Norm'sRecord);
(* val it = 4000 : int *)

tuition({name="Mona Kerr", ID=54321, courses=["CS105"]});
(* val it = 2000 : int *)

(*----------------------------------------------------------------------------*)

val A = Array.array(5, 0);
(* val A = [|0,0,0,0,0|] : int array *)
 
A;
(* val it = [|0,0,0,0,0|] : int array *)

Array.sub(A, 3);
(* val it = 0 : int *)

Array.update(A, 3, 17);
(* val it = () : unit *)

A;
(* val it = [|0,0,0,17,0|] : int array *)

Array.sub(A, 3);
(* val it = 17 : int *)

(*----------------------------------------------------------------------------*)

val i = ref 1;
(* val i = ref 1 : int ref *)

while !i<=10 do(
  print(Int.toString(!i));
  print(" ");
  i := !i + 1
);
(* 1 2 3 4 5 6 7 8 9 10 val it = () : unit *)

(*-------------------------------Chapter-8------------------------------------*)
(* Encapsulation and the ML Module System *)

structure Mapping = struct
  exception NotFound;

  val create = nil;

  fun lookup(d,nil) = raise NotFound
  |   lookup(d,(e,r)::es) =
        if d=e then r
        else lookup(d,es);

  fun insert(d,r,nil) = [(d,r)]
  |   insert(d,r,(e,s)::es) =
        if d=e then (d,r)::es
        else (e,s)::insert(d,r,es)
end;
(* structure Mapping : *)
(*   sig *)
(*     exception NotFound *)
(*     val create : 'a list *)
(*     val lookup : ''a * (''a * 'b) list -> 'b *)
(*     val insert : ''a * 'b * (''a * 'b) list -> (''a * 'b) list *)
(*   end *)

signature RESTRICTEDMAPPING = sig
  exception NotFound;
  val lookup : ''a * (''a * 'b) list -> 'b
end;
(* signature RESTRICTEDMAPPING = *)
(*   sig *)
(*     exception NotFound *)
(*     val lookup : ''a * (''a * 'b) list -> 'b *)
(*   end *)

structure restrictedMapping: RESTRICTEDMAPPING = Mapping;
(* structure restrictedMapping : RESTRICTEDMAPPING *)

signature SIMAPPING = sig
  exception NotFound;
  val create : (string * int) list;
  val insert : string * int * (string * int) list -> (string * int) list;
  val lookup : string * (string * int) list -> int
end;
(* signature SIMAPPING = *)
(*   sig *)
(*     exception NotFound *)
(*     val create : (string * int) list *)
(*     val insert : string * int * (string * int) list -> (string * int) list *)
(*     val lookup : string * (string * int) list -> int *)
(*   end *)

structure SiMapping: SIMAPPING = Mapping;
(* structure SiMapping : SIMAPPING *)

(*----------------------------------------------------------------------------*)

signature TOTALORDER = sig
  type element;
  val lt : element * element -> bool
end;
(* signature TOTALORDER =                        *)
(*   sig                                         *)
(*     type element                              *)
(*     val lt : element * element -> bool        *)
(*   end                                         *)

functor MakeBST(Lt: TOTALORDER):
  sig
    type 'label btree;
    exception EmptyTree;
    val create : Lt.element btree;
    val lookup : Lt.element * Lt.element btree -> bool;
    val insert : Lt.element * Lt.element btree -> Lt.element btree;
    val deletemin : Lt.element btree -> Lt.element * Lt.element btree;
    val delete : Lt.element * Lt.element btree -> Lt.element btree
  end
=
  struct
    open Lt;

    datatype 'label btree =
      Empty |
      Node of 'label * 'label btree * 'label btree;

    val create = Empty;

    fun lookup(x, Empty) = false
    |   lookup(x, Node(y,left,right)) =
          if lt(x,y) then lookup(x, left)
          else if lt(y,x) then lookup(x,right)
          else (* x=y *) true;

    fun insert(x, Empty) = Node(x,Empty,Empty)
    |   insert(x, T as Node(y,left,right)) =
          if lt(x,y) then Node(y,insert(x,left),right)
          else if lt(y,x) then Node(y,left,insert(x,right))
          else (* x=y *) T; (* do nothing; x was
                               already there *)

    exception EmptyTree;

    fun deletemin(Empty) = raise EmptyTree
    |   deletemin(Node(y,Empty,right)) = (y,right)
    |   deletemin(Node(w,left,right)) =
          let
            val (y,L) = deletemin(left)
          in
            (y, Node(w,L,right))
          end;

    fun delete(x, Empty) = Empty
    |   delete(x, Node(y,left,right)) =
          if lt(x,y) then Node(y, delete(x,left),right)
          else if lt(y,x) then Node(y,left,delete(x,right))
          else (* x=y *)
            case (left,right) of
                 (Empty,r) => r |
                 (l,Empty) => l |
                 (l,r) =>
                   let
                     val (z,r1) = deletemin(r)
                   in
                     Node(z,l,r1)
                   end;

  end;
(* functor MakeBST(Lt: sig                                                    *)
(*                       type element                                         *)
(*                       val lt : element * element -> bool                   *)
(*                     end) :                                                 *)
(*                sig                                                         *)
(*                  type 'a btree                                             *)
(*                  exception EmptyTree                                       *)
(*                  val create : Lt.element btree                             *)
(*                  val lookup : Lt.element * Lt.element btree -> bool        *)
(*                  val insert : Lt.element * Lt.element btree                *)
(*                               -> Lt.element btree                          *)
(*                  val deletemin : Lt.element btree                          *)
(*                                  -> Lt.element * Lt.element btree          *)
(*                  val delete : Lt.element * Lt.element btree                *)
(*                               -> Lt.element btree                          *)
(*                end                                                         *)

structure String: TOTALORDER =
  struct
    type element = string;
    fun lt(x,y) =
    let
      fun lower(nil) = nil
      |   lower(c::cs) =
            (Char.toLower c)::lower(cs);
    in
      implode(lower(explode(x))) <
        implode(lower(explode(y)))
    end;
  end;
(* structure String : TOTALORDER    *)

structure StringBST = MakeBST(String);
(* structure StringBST :                                                      *)
(*   sig                                                                      *)
(*     datatype 'a btree = ...                                                *)
(*     exception EmptyTree                                                    *)
(*     val create : Lt.element btree                                          *)
(*     val lookup : Lt.element * Lt.element btree -> bool                     *)
(*     val insert : Lt.element * Lt.element btree -> Lt.element btree         *)
(*     val deletemin : Lt.element btree -> Lt.element * Lt.element btree      *)
(*     val delete : Lt.element * Lt.element btree -> Lt.element btree         *)
(*   end                                                                      *)

(*----------------------------------------------------------------------------*)

(* alternatively... *)
(* functor MakeBST(structure Lt: TOTALORDER): *)
(* ... *)

(* structure StringBST = MakeBST(structure Lt = String); *)

(*----------------------------------------------------------------------------*)

(* signature INT = sig val i: int end; *)
(* signature REAL = sig val r: real end; *)

(* functor Foo(structure I: INT and R:REAL) = ... *)
(* functor Foo(structure I: INT; structure R: REAL) = ... *)
(* functor Foo(structure I: INT and R: REAL; val x : INT) = ... *)

(* structure Int = struct val i = 0 end; *)
(* structure Real = struct val r = 0.0 end; *)

(* structure Bar = Foo(structure I = Int; structure R = Real); *)
(* structure Bar = Foo(structure I = Int and R = Real); *)

(*----------------------------------------------------------------------------*)

(* sharing type <type> = <type> = ... = <type>      *)
(* the types must be the same                       *)

(* sharing <structure> = <structure> = ... = <structure>              *)     
(* identically named types within the structures must be the same     *)
