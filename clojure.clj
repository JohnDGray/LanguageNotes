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
