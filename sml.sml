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


(*----------------------------------------------------------------------------*)

(*-------------------------------Chapter-6------------------------------------*)
(* Defining Your Own Types *)


(*----------------------------------------------------------------------------*)

(*-------------------------------Chapter-7------------------------------------*)
(* More About ML Data Structures *)


(*----------------------------------------------------------------------------*)

(*-------------------------------Chapter-8------------------------------------*)
(* Encapsulation and the ML Module System *)

(*----------------------------------------------------------------------------*)
