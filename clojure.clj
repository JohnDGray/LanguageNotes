;;literals
1
"a string"
["a" "vector" "of" "strings"]

;;operations
(operator operand1 operand2 ... operandn)

(+ 1 2 3)
;;6

(str "It was the panda " "in the library " "with a dust buster")
;"It was the panda in the library with a dust buster"

;;control flow
;;if
(if boolean-form
  then-form
  optional-else-form)

;;do
(if true
  (do (println "Success!")
      "By Zeus's hammer!")
  (do (println "Failure!")
      "By Aquaman's trident!"))
;;Success!
;;"By Zeus's hammer!"

;;when - like a combination of 'if' and 'do' but with no 'else'
(when true
  (println "Success!")
  "abra cadabra")
;;Success!
;;"abra cadabra"

;;falsey values: 'false' and 'nil'
;;truthy values: everything else

;;check if nil
(nil? nil)
;;true

;;equality
(= 1 1)
;;true

;;naming values with def
(def stuff
  ["a" "b" "c"])

stuff
;;["a" "b" "c"]

;;maps
{:first-name "Charlie"
 :last-name "McFishwich"}

{"string-key" +}

{:name {:first "John" :middle "Jacob" :last "Jingleheimerschmidt"}}

(hash-map :a 1 :b 2)
;;{:a 1 :b 2}

(get {:a 0 :b 1} :b)
;;1

(get {:a 0 :b {:c "ho hum"}} :b)
;;{:c "ho hum"}

(get {:a 0 :b 1} :c)
;;nil

(get {:a 0 :b 1} :c)
;;nil

(get {:a 0 :b 1} :c "unicorns?")
;;"unicorns?"

(get-in {:a 0 :b {:c "ho hum"}} [:b :c])
;;"ho hum"

({:name "The Human Coffeepot"} :name)
;;"The Human Coffeepot"

;;keywords
:a
:rumplestiltskin
:34
:_?

(:a {:a 1 :b 2 :c 3})
;;1

(:d {:a 1 :b 2 :c 3} "No gnome knows homes like Noah knows")
 ;;"No gnome knows homes like Noah knows"

;;vectors
[3 2 1]

(get [3 2 1] 0)
;;3

(get ["a" {:name "Pugsley Winterbottom"} "c"] 1)
;;{:name "Pugsley Winterbottom"}

(vector "creepy" "full" "moon")
;;["creepy" "full" "moon"]

(conj [1 2 3] 4)
;;[1 2 3 4]

;;lists
'(1 2 3 4)

(nth '(:a :b :c) 0)
;;:a

(nth '(:a :b :c) 2)
;;:c

(list 1 "two" {3 4})
;;(1 "two {3 4})

(conj '(1 2 3) 4)
;; (4 1 2 3)

;;sets
#{"kurt vonnegut" 20 :icicle}

(hash-set 1 1 2 2)
;;#{1 2}

(conj #{:a :b} :b)
;;#{:a :b}

(set [3 3 3 4 4])
;;#{3 4}

(contains? #{:a :b} :a)
;;true

(contains? #{:a :b} 3)
;;false

(contains? #{nil} nil)
;;true

(:a #{:a :b})
;;:a

(get #{:a :b} :a)
;;:a

(get #{:a nil} nil)
;;nil

(get #{:a :b} "kurt vonnegut")
;;nil

;;functions

;;function calls
(+ 1 2 3 4)
(* 1 2 3 4)
(first [1 2 3 4])

(or + -)
;;#<core$_PLUS_ clojure.core$_PLUS_@76dace31>

((or + -) 1 2 3)
;;6

((and (= 1 1) +) 1 2 3)
;;6

((first [+ 0]) 1 2 3)
;;6

(inc 1.1)
;;2.1

(map inc [0 1 2 3])
;;(1 2 3 4)


;;defining functions

;;function definitions are composed of five main parts
;;1. 'defn'
;;2. function name
;;3. an optional docstring
;;4. parameters listed in brackets
;;5. function body
(defn say-hello
  "Say hello to someone"
  [name]
  (str "Hello " name))

(say-hello "bob")
;;"Hello bob"

(defn multi-arity
  ;; 3-arity arguments and body
  ([first-arg second-arg third-arg]
   (do-things first-arg second-arg third-arg))
  ;; 2-arity arguments and body
  ([first-arg second-arg]
   (do-things first-arg second-arg))
  ;; 3-arity arguments and body
  ([first-arg]
   (do-things first-arg)))

;;rest parameter
(defn add-two
  [number]
  (+ 2 number))

(defn add-two-ls
  [& numbers]
  (map add-two numbers))

(defn favorite-things
  [name & things]
  (str "Hi, " name ", here are my favorite things: "
       (clojure.string/join ", " things)))

(favorite-things "Sam" "gum" "shoes" "kara-te")
;;"Hi, Sam, here are my favorite things: gum, shoes, kara-te"

;;destructuring

;;return the first element of a collection
(defn my-first
  [[first-thing]]
  first-thing)

(my-first ["oven" "bike" "war-axe"])
;;"oven"

(defn chooser
  [[first-choice second-choice & unimportant-choices]]
  (println (str "Your first choice is: " first-choice))
  (println (str "Your second choice is: " second-choice))
  (println (str "We're ignoring the rest of your choices. "
                "Here they are in case you need to cry over them: "
                (clojure.string/join ", " unimportant-choices))))

(chooser ["Marmalade", "Handsome Jack", "Pigpen", "Aquaman"])
;;Your first choice is: Marmalade
;;Your second choice is: Handsome Jack
;;We're ignoring the rest of your choices. Here they are in 
;;case you need to cry over them: Pigpen, Aquaman

(defn announce-treasure-location
  [{lat :lat lng :lng}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng)))

(announce-treasure-location {:lat 28.22 :lng 81.33})
;;Treasure lat: 100
;;Treasure lng: 50

;;equivalent to above
(defn announce-treasure-location
  [{:keys [lat lng]}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng)))

(defn receive-treasure-location
  [{:keys [lat lng] :as treasure-location}]
  (println (str "Treasure lat: " lat))
  (println (str "Treasure lng: " lng))
  (steer-ship! treasure-location)) ;; the point is that the original map is still accessible

;;function body
(defn illustrative-function
  []
  (+ 1 304)
  30
  "joe")

(illustrative-function)
;;"joe"

;;anonymous functions
(map (fn [name] (str "Hi, " name))
     ["Darth Vader" "Mr. Magoo"])
;;("Hi, Darth Vader" "Hi, Mr. Magoo")

((fn [x] (* x 3)) 8)
;;24

(#(str %1 " and " %2) "cornbread" "butter beans")
;;"cornbread and butter beans"

(#(identity %&) 1 "blarg" :yip)
;;(1 "blarg" :yip)

;;returning functions
(defn inc-maker
  "Create a custom incrementor"
  [inc-by]
  #(+ % inc-by))

(def inc3 (inc-maker 3))

(inc3 7)
;;10
