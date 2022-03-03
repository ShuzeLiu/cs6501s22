import .bool

namespace hidden 

-- DATA TYPE

inductive bool_lang : Type
| TT : bool_lang
| FF : bool_lang
| conj (e1 e2 : bool_lang) : bool_lang
| disj (e1 e2 : bool_lang) : bool_lang
| neg (e : bool_lang)


-- REFACTOR INTO TEST FILE
open bool_lang

def be1 := TT
def be2 := FF
def be3 := conj be1 be2
def be4 := neg be3

open boo

-- OPERATIONS
def eval : bool_lang → boo
| TT := tt
| FF := ff
| (conj e1 e2) := and (eval e1) (eval e2)
| (disj e1 e2) := or (eval e1) (eval e2)
| (neg e) := not (eval e)

-- REFACTOR INTO TEST FILE
#reduce eval be4
#reduce eval (conj (disj be2 be4) be3)

-- NOTATIONS
notation b1 * b2 := conj b1 b2
notation b1 + b2 := disj b1 b2
prefix ! := neg

-- REFACTOR INTO TEST FILE
#reduce eval ((be2 + be4) * be3)

-- PROPERTIES?

end hidden