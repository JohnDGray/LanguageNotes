
(*-------------------------getting started-------------------------*)
~1234;

(* single character *)
#"x";

(* string concatenation *)
"house" ^ "cat";

(* combining logical values *)
1<2 orelse 3>4;
(* val it = true : bool *)

1<2 andalso 3>4;
(* val it = false : bool *)

(* if-then-else *)
if 1<2 then 3+4 else 5+6;
(* val it = 7 : int *)

(* assignment *)
val pi = 3.14159;

(* tuples *)
val t = (4, 5.0, "six");
(* val t = (4, 5.0, "six") : int * real * string *)

#3 (t);
(* val it = "six" : string *)
(* note: t is the above defined tuple *)

(* lists *)
[1, 2, 3];
(* val it = [1, 2, 3] : int list *)

val L = [2, 3, 4];
(* val L = [2, 3, 4]; : int list *)

hd(L);
(* val it = [3, 4]: int list *)

tl(L);
(* val it = [3, 4] : int list *)

[1, 2]@[3, 4];
(* val it = [1, 2, 3, 4] : int list *)

2::[3, 4];
(* val it = [2, 3, 4] : int list *)

1::2::3::nil;
(* val it = [1, 2, 3] : int list *)

explode("abcd");
(* val it = [#"a", #"b", #"c", #"d"] : char list *)

implode([#"a", #"b", #"c", #"d"]);
(* val it = "abcd" : string *)

concat(["ab", "cd", "e"]);
(* val it = "abcde" : string *)

(*-------------------------defining functions-------------------------*)

fun square (x: real) = x * x;
(* val square = fn : real -> real *)

pi * square radius;
(* val it = 50.26533 : real *)

fun reverse (L) =
  if L = nil then nil
  else reverse(tl(L)) @ [hd(L)];
(* val reverse = fn : 'a list -> 'a list *)

(* mutual recursion *)
fun
  take (L) =
    if L = nil then nil
    else hd(L)::skip(tl(L))
and
  skip (L) =
    if L = nil then nil
    else take(tl(L));
(* val take = fn : 'a list -> 'a list *)
(* val skip = fn: 'a list -> 'a list *)

(* patterns *)
fun merge(nil, M) = M
|   merge(L, nil) = L
|   merge(L as x::xs, M as y::ys) = 
      if x<y then x::merge(xs, M)
      else y::merge(L, ys);
(* val merge = fn : int list * int list -> int list *)

(* let *)
fun hundredthPower(x : real) =
  let
    val four = x*x*x*x;
    val twenty = four*four*four*four*four
  in
    twenty * twenty * twenty * twenty * twenty
  end;
(* val hundredthPower = fn : real -> real *)

(* splitting tuples and lists *)
val (a, b, c) = (1, 2, 3);

val [x, y, z] = [8, 9, 10];

(* statement lists *)
fun printList(nil) = ()
|   printList(x::xs) = (
      print(Int.toString(x));
      print("\n");
      printList(xs)
    );
(* printList = fn : int list -> unit *)


