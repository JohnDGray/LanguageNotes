
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


