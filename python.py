#Interpreter with command:
python -c command [arg] ...

#Inspection odds and ends
dir()
dir(CLASS.__init__)
CLASS.__init__.__defaults__
CLASS.__mro__
CLASS.__subclasses__()
issubclass(a, b)
isinstance(a, b)
type(a)

#######################################################################

3 * 'un' + 'ium'
#'unununium'

ls[:] #returns a copy of the list

ls[2:5] = ['C', 'D', 'E'] #does the obvious thing

#multiple assignment
a, b = 0, 1

#print without newline
print(b, end=',')

for w in words[:]: #loop over a copy of words
    #do something

for/while ... else #else executes as long as there was no artificial break

pass #does nothing

######################################################################

#arbitrary argument lists:
def concat(*args, sep='/'):
    return sep.join(args)

concat('earth', 'mars', 'venus')
#'earth/mars/venus'
concat('earth', 'mars', 'vanus', sep='.')
#'earth.mars.venus'

######################################################################

#unpacking argument lists:
args = [3, 6]
list(range(*args))
#[3, 4, 5]

######################################################################

def name_age(name, age):
    print(name, "is", age, "years old.")

d = {"name": "tom", "age": 45}
name_age(**d)
#tom is 45 years old

######################################################################

#this
my_function(a=1, b=1, c=1)
#is equivalent to this
args = {'a': 1, 'b': 2, 'c': 3}
my_function(**args)

######################################################################

#lambdas
lambda a, b: a + b

#documentation strings
def my_function():
    """Do nothing, but document it

    No, no, really, it doesn't do anything.
    """
    pass

print(my_function.__doc__)
#Do nothing, but document it.
#
#    No, no, really, it doesn't do anything.

######################################################################

#function annotations
def f(ham: str, eggs: str = 'eggs') -> str:
    print('Annotations:', f.__annotations__)
    print('arguments:', ham, eggs)
    return ham + ' and ' + eggs

f('spam')
#Annotations: {'ham': <class 'str'>, 'return': <class 'str'>, 'eggs': <class 'str'>}
#Arguments: spam eggs
#'spam and eggs'

######################################################################

#list comprehensions
squares = [x**2 for x in range(10)]

[(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]
#[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]

[(x, x**2) for x in range(6)]
#[(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25)]

vec = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
[num for elem in ven for num in elem]
#[1, 2, 3, 4, 5, 6, 7, 8, 9]

matrix = [[1, 2, 3, 4],
          [5, 6, 7, 8],
          [9, 10, 11, 12]]
[[row[i] for row in matrix] for i in range(4)]
#[[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]

#delete from a list by index
del ls[index]
del ls[start:end]

t = 1, 2, 3
t
#(1, 2, 3)
x, y, z = t
x
#1
y
#2
z
#3

######################################################################
#sets

a = set('abracadabra')
b = set('alacazam')
a
#{'a', 'r', 'b', 'c', 'd'}
a-b
#{'r', 'd', 'b'}
a|b
#{'a', 'c', 'r', 'd', 'b', 'm', 'z', 'l'}
a&b
#{'a', 'c'}
a^b
#{'r', 'd', 'b', 'm', 'z', 'l'}
a = {x for x in 'abracadabra' if x not in 'abc'}
a
{'r', 'd'}

######################################################################
#dictionaries

#keys of dictionary must be immutable:
#strings, numbers, tuples (of strings, numbers, tuples)
tel = {'jack': 4098, 'sape': 4139}
tel['guide'] = 4127
tel['jack']
#4098
del tel['sape']
list(tel.keys())
#['jack', 'guido']
sorted(tel.keys())
#['guido', 'jack']
'guido' in tel
#True

dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
#{'sape': 4139, 'jack': 4098, 'guido': 4127}

{x: x**2 for x in (2, 4, 6)}
#{2: 4, 4: 16, 6: 36}

knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.items():
    print(k, v)
#gallahad the pure
#robin the brave

for i, v in enumerate(['tic', 'tac', 'toe']):
    print(i, v)
#0 tic
#1 tac
#2 toe

######################################################################

questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']
for q, a in zip(questions, answers):
    print('What is your {0}? It is {1}.'.format(q, a))
#What is your name? It is lancelot.
#What is your quest? It is the holy grail.
#What is your favorite color? It is blue.


######################################################################

#printing values
print('{0} and {1}'.format('spam', 'eggs'))
#spam and eggs

#open file
with open('workfile', 'r' as f: #r -> read, w -> write, a -> append
    f.read()
    #'This is the entire file.\n'

    f.readline()
    #'This is the first line of the file.\n'

    for line in f:
        print(line, end='')
    #This is the first line of the file.
    #Second line of the file.

    f.close()

######################################################################
#Errors and Exceptions
for arg in sys.argv[1:]:
    try:
        f = open(arg, 'r')
    except OSError:
        print('cannot open', arg)
    else:
        print(arg, 'has', len(f.readlines()), 'lines')
        f.close()
    finally:
        print('executing finally clause')


######################################################################
#Classes
class Complex:
    def __init__(self, realpart, imagpart):
        self.r = realpart
        self.i = imagpart

x = Complex(3.0, -4.5)
x.r, x.i
(3.0, -4.5)

xf = x.f
while True:
    print(xf())

class Dog:
    kind = 'canine'         #class variable

    def __init__(self, name):
        self.name = name    #instance variable

class DerivedClassName(Base1, Base2, Base3):
    ...

#private variables should be prefaced by an underscore
#they can still be accessed


######################################################################
#Iterators
s = 'abc'
it = iter(s)
it
#<iterator object at 0x00A1DB50>
next(it)
#'a'
next(it)
#'b'
next(it)
#'c'
next(it)
#Stop Iteration (exception)

class Reverse:
    """Iterator for looping over a sequence backwards."""
    def __init__(self, data):
        self.data = data
        self.index = len(data)

    def __iter__(self):
        return self

    def __next__(self):
        if self.index == 0:
            raise StopIteration
        self.index = self.index - 1
        return self.data[self.index]

######################################################################
#Generators
def reverse(data):
    for index in range(len(data)-1, -1, -1):
        yield data[index]


######################################################################
#Generator Expressions
sum(i*i for i in range(10)) #sum of squares
#285

xvec = [10, 20, 30]
yvec = [7, 5, 3]
sum(x*y for x, y in zip(xvec, yvec)) #dot product
#260


######################################################################
for color in colors:
    print(color)

for color in reversed(colors):
    print(color)

for i, color in enumberate(colors):
    print(i, '-->', color)

for name, color in zip(names, colors):
    print(name, '-->', color)

print sorted(colors, key=len)

#2 argument form of iter requires
#function to take 0 arguments
#partial turns f.read from a function of 1 argument
#into a function of zero arguments
blocks = []
for block in iter(partial(f.read, 32), ' '): #reads until space
        blocks.append(block)

def find(seq, target):
    for i, value in enumerate(seq):
        if value == target:
            break
    else:
        return -1
    return i

d = {'matthew': 'blue', 'rachel': 'green', 'raymond': 'red'}

for k in d: #for key in dictionary
    print(k)

for k, v in d.items():
    print(k, '-->', v)

d = dict(zip(names, colors))

d = dict(enumerate(names))

colors = ['red', 'green', 'red', 'blue']
d = {}
for color in colors:
    if color not in d:
        d[color] = 0
    d[color] += 1

for color in colors:
    d[color] = d.get(color, 0) + 1

d = defaultdict(int)
for color in colors:
    d[color] += 1


######################################################################
#Grouping with Dictionaries
d = {}
for name in names:
    key = len(name)
    if key not in d:
        d[key] = []
    d[key].append(name)

d = {}
for name in names:
    key = len(name)
    d.setdefault(key, []).append(name)

d = defaultdict(list)
for name in names:
    key = len(name)
    d[key].append(name)


######################################################################
#Linking Dictionaries
d = ChainMap(dict1, dict2, dict3) #look in dict1, then dict2, then dict3


######################################################################
#Named Tuple
#from collections import namedtuple
Point = namedtyple('Point', 'x y')
pt = Point(1.0, 5.0)
print(pt.x)


######################################################################
#Virtual Environment
pyvenv my_env
source my_env/bin/activate
deactivate

######################################################################

#Fluent Python

######################################################################
#Special Methods

#Implement dunder methods. Use __repr__ for developers, __str__ for end users.
#Prefer __repr__ if implementing only one, since __str__ falls back to __repr__.

#Implement
Class Deck():

    #define self._cards to represent a standard 52 card deck

    def __len__(self):
        return len(self._cards)

    def __getitem__(self, position):
        return self._cards[position]

#Use
#these things are possible because we implemented
#__len__ and __getitem__
deck = Deck()
len(deck)
#52
deck[0]
#Card(rank='2', suit='spades')
from random import choice
choice(deck)
#Card(rank='3', suit='hearts')
deck[12::13]
#[Card(rank='A', suit='spades'),...]
for card in deck:
    print(card)

Card('Q', 'hearts') in deck
#True


######################################################################
#Tuples
traveler_ids = [('USA', '311'), ('BRA', 'CE3'), ('ESP', 'XDA')]
for passport in sorted(traveler-ids):
    print('%s/%s' % passport)
#BRA/CE3
#ESP/XDA
#USA/311

for country, _ in traveler_ids:
    print(country)

#USA
#BRA
#ESP


######################################################################
a, b, *rest = range(5)
a, b, rest
#(0, 1, [2, 3, 4])
a, b, *rest = range(2)
a, b, rest
#(0, 1, [])
a, *body, c = range(5)
a, body, c
#(0, [1, 2, 3], 4)

metro_areas = [
    ('Tokyo', 'JP', 36.9, (35.7, 139.7)),
    ('Mexico City', 'MX', 20.1, (19.4, -99.1))]

for name, cc, pop, (lattitude, longitude) in metro_areas:
    #do stuff


######################################################################
#Named Slice
DESCRIPTION = slice(6, 40)
ITEM_TOTAL = slice(55, None)
print(item[DESCRIPTION]) #equivalent to print(item[6:40])
print(item[ITEM_TOTAL])  #equivalent to print(item[55:])

a[min, k:l] #multidimensional slice
x[i, ...] #if x is a four-dimensional array this is quivalent to x[i, :, :, :,]

l = list(range(10))
l[2:5] = [20, 30]
l
#[0, 1, 20, 30, 5, 6, 7, 8, 9]
l[3::2] = [11, 22]
l
#[0, 1, 20, 11, 5, 22, 7, 8, 9]


######################################################################
#use bisect.insert to insert items into a sorted sequence
#use bisect.bisect to search in a sort sequence

######################################################################
#If a list will only contain numbers, an array.array is more efficient.
from array import array
from random import random
floats = array('d', (random() for i in range(10**7)))
fp = open('floats.bin', 'wb')
floats.tofile(fp)
fp.close()
floats2 = array('d')
fp = open('floats.bin', 'rb')
floats2.fromfile(fp, 10**7)
fp.close()
floats2 == floats1
#True

######################################################################

from collections import deque
dq = deque(range(10), maxlen=10)
dq
#deque([0,1,2,3,4,5,6,7,8,9], maxlen=10)
dq.rotate(3)
dq
#deque([7,8,9,0,1,2,3,4,5,6], maxlen=10)
dq.rotate(-4)
dq
#deque([1,2,3,4,5,6,7,8,9,0], maxlen=10)
dq.appendleft(-1)
dq
#deque([-1,1,2,3,4,5,6,7,8,9], maxlen=10)
dq.extend([11,22,33])
dq
#deque([3,4,5,6,7,8,9,11,22,33], maxlen=10)


######################################################################

#collections.OrderedDict
#collections.ChainMap
#collections.Counter
ct = collections.Counter('abracadabra')
ct
#Counter({'a': 5, 'b': 2, 'r': 2, 'c': 1, 'd': 1})
ct.update('aaaaazzz')
ct
#Counter({'a': 10, 'z': 3, 'b': 2, 'r': 2, 'c': 1, 'd': 1})
ct.most_common(2)
[('a', 10), ('z', 3)]

######################################################################

import collections
class StrKeyDict(collections.UserDict):
    def __missing__(self, key):
        if isinstance(key, str):
            raise KeyError(key)
        return self[str(key)]

    def __contains__(self, key):
        return str(key) in self.data

    def __setitem__(self, key, item):
        self.data[str(key)] = item

######################################################################

#Immutable Mappings
from types import MappingProxyType
d = {1: 'A'}
d_proxy = MappingProxyType(d)
d_proxy[1]
#'A'

######################################################################
#make class callable
class MyClass():
    #...
    def __call__(self):
        #some code

my_class = MyClass()
my_class() #possible because of implementation of __call__


######################################################################
#keyword-only arguments:
def f(a, *, b):
    return a, b

f(1, b=2)
(1, 2)

######################################################################

#Function Annontations
def clip(text: str, max_len:'int > 0'=80) -> str:
    #...

######################################################################

#The Operator Module
from functools import reduce
from operator import mul
def fact(n):
    return reduce(mul, range(1, n+1))

from operator import itemgetter
cc_name = itemgetter(1, 0)
for city in metro_data:
    print(cc_name(city))

#attrgetter extracts object attributes by name
#can navigate through nested objects
from operator import attrgetter
name_lat = attrgetter('name', 'coord.lat')
for city in metro_areas:
    print(name_lat(city))

#method caller
from operator import methodcaller
s = 'The time has come'
hiphenate = methodcaller('replace', ' ', '-')
hiphenate(s)
#The-time-has-come

#using partial to use a two-argument function where a one-argument callable is required
from operator import mul
from functools import partial
triple = partial(mul, 3)
triple(7)
#21
list(map(triple, range(1, 10)))
#[3, 6, 9, 12, 15, 18, 21, 24, 27]

######################################################################

#first class functions
#the promos list is built by introspection of the module global namespace
promos = [globals()[name] for name in globals()
            if name.endswith('_promo')
            and name != 'best_promo']

def best_promo(order):
    return max(promo(order) for promo in promos)

#alternative approach
import inspect
import promotions   #user created module

promos = [func for name, func in
            inspect.getmembers(promotions, inspect.isfunction)]

def best_promo(order):
    return max(promo(order) for promo in promos)

######################################################################
#decorators

#assuming the existence of a decorator named 'decorate', these two
#codeblocks are equivalent:
@decorate
def target():
    print('running target()')


def target():
    print('running target()')

target = decorate(target)

######################################################################
def deco(func):
    def inner():
        print('running inner()')
    return inner

@deco
def target():
    print('running target()')

target()
#running inner()
target
#<function deco.<locals>.inner at 0x10063b598

######################################################################

#decorators for registration
promos = []
def promotion(promo_func):
    promos.append(promo_func)
    return promo_func

@promotion
def fidelity(order):
    #...

def best_promo(order):
    return max(promo(order) for promo in promos)

######################################################################

#nonlocal keyword
def make_averager():
    count = 0
    total = 0

    def averager(new_value):
        nonlocal count, total   #necessary to avoid having count and total treated as local variables
        count += 1
        total += new_value
        return total/count

    return averager

######################################################################

#a simple decorator to output the running time of functions
import time

def clock(func):
    def clocked(*args):
        t0 = time.perf_counter()
        result = func(*args)
        elapsed = time.perf_counter() - t0
        name = func.__name__
        print(elapsed, name)
        return result
    return clocked

#use
@clock
def snooze(seconds):
    time.sleep(seconds)

######################################################################
import functools
@functools.lru_cache()
def fibonacci(n):
    if n < 2:
        return n
    return fibonacci(n-2) + fibonacci(n-1)


######################################################################
from functools import singledispatch
import html

@singledispatch
def htmlize(obj):
    content = html.escape(repr(obj))
    return '<pre>{}</pre>'.format(content)

@htmlize.register(str)
def _(text):
    content = html.escape(text).replace('\n', '<br>\n')
    return '<p>{0}</p>'.format(content)


######################################################################
@d1
@d2
def f():
    print('f')

#is the same as
def f():
    print('f')

f = d1(d2(f))

######################################################################

#parameterized decorators
registry = set()

def register(active = True):
    def decorate(func):
        print('running register(active = %s)->decorate(%s)'
              % (active, func))
        if active:
            registry.add(func)
        else:
            registry.discard(func)

        return func
    return decorate

@register(active=False)
def f1():
    print('running f1()')

@register()
def f2():
    print('running f2()')

######################################################################

#Object References, Mutability, and Recycling
# copy module provides copy.deepcopy

# weakref provides weak reference collections, i.e. collections that
# will not prevent their members from being garbage collected
# unless they are also referenced somewhere else
# WeakValueDictionary and WeakKeyDictionary are examples
# Some types cannot be targets of weak references (list, dict, int, tuple etc.)

######################################################################

#A Pythonic Object
#@classmethod: receives the class as its first argument
#@staticmethod: does not receive an implicit first argument, 
#       essentially just a normal function inside a class definition
#@staticmethod arguably serves no purpose

#implementing __format__
#inside the Vector2d class
def __format__(self, fmt_spec=''):
    components = (format(c, fmt_spec) for x in self)
    return '({}, {})'.format(*components)

#read_only properties
class Vector2d:
    def __init__(self, x, y):
        self.__x = float(x)
        self.__y = float(y)

    @property
    def x(self):
        return self.__x

######################################################################

#Sequence Hacking, Hashing, and Slicing
#A sequence needs to implement __len__ and __getitem__
#To support interation only __getitem__ is necessary

######################################################################

def __eq__(self, other):
    return len(self) = len(other) and all(a == b for a, b in zip(self, other))

######################################################################
#interfaces

#subclassing an Abstract Base Class
class <MyClass>(<ABC>):
    #...

#defining an ABC:
class <MyABC>(abc.ABC):
    #...

#registering a class as a virtual subclass:
@<ABC>.register
class <MyClass>():
    #...

#OR:
<ABC>.register(<MyClass>)

#number ABCs: numbers.Number, ..., numbers.Integral

# ABCs in collections.abc
# Iterable, Container, Sized
# Sequence, Mapping, Set
# Mapping View
# Callable, Hashable
# Iterator

######################################################################

#in CPython, don't subclass built-in types: the results can be unpredictable
#instead, subclass types from the collections module like UserDict, UserList, UserString etc.
import collections

class DoppelDict2(collections.UserDict):
    #...

######################################################################

#Unary Operators
# -       __neg__       if x is -2 then -x == 2
# +       __pos__
# ~       __invert__    if x is 2 then ~x == -3
# abs()   __abs__       if x is -2 then abs(x) == 2

# Other Operators
# +       __add__       2+3 == 5
#         __radd__      add method for right-hand argument, important when adding different types

def __add__(self, other):
    try:
        pairs = itertools.zip_longest(self, other, fillvalue=0.0)
        return Vector(a + b for a, b in pairs)
    except TypeError:
        return NotImplemented

#in general: infix operators
#add, sub, mul, truediv, floordiv, mod, divmod, pow, matmul (matrix multiplication), and, or, xor, lshift, rshift

#rich comparison operators
#eq, ne, gt, lt, ge, le
def __eq__(self, other):
    if isinstance(other, Vector):
        return (len(self) == len(other) and 
                and(a == b for a, b in zip(self, other)))
    else:
        return NotImplemented

#Augmented Assignment Operators
#when not implemented, just syntactic sugar: a+=b is just a = a+b
#only implement to change in place
def __iadd__(self, other):
    if isinstance(other, Tombola):
        other_iterable = other.inspect()
    else:
        try:
            other_iterable = iter(other)
        except TypeError:
            self_cls = type(self).__name__
            msg = "right operand in += must be {!r} or an iterable"
            raise TypeError(msg.format(self_cls))
    self.load(other_iterable)
    return self


######################################################################
#iterators and generators

#when the interpreter needs to interate over an object it calls iter(x)
#1.)checks whether x implements __iter__ and if not 2.) checks __getitem__

#iterable: any object from which the iter build-in function can obtain an iterator

#iterator:
    __next__
        #returns the next available item, or raises StopIteration

    __iter__
        #returns self


#iterable:
    __iter__
        #returns a new iterator


#this
s = 'ABC'
for char in s:
    print(char)

#is equivalent to
s = 'ABC'
it = iter(s)
while True:
    try:
        print(next(it))
    except StopIteration:
        del it
        break


######################################################################

import re

RE_WORD = re.compile('\w+')

class Sentence:
    def __init__(self, text):
        self.text = text
        self.words = RE_WORD.findall(text)

    def __iter__(self):
        return SentenceIterator(self.words)

class SentenceIterator:
    def __init__(self, words):
        self.words = words
        self.index = 0

    def __next__(self):
        try:
            word = self.words[self.index]
        except IndexError:
            raise StopIteration()
        self.index += 1
        return word

    def __iter__(self):
        return self

# iterables have an __iter__ method that instantiates a new iterator every time
# iterators implement a __next__ method that returns individual items, and an __iter__
#     method that returns self.
# therefore, iterators are also iterable, but iterables are not iterators

#using a generator function
import re

RE_WORD = re.compile('\w+')

class Sentence:
    def __init__(self, text):
        self.text = text
        self.words = RE_WORD.findall(text)

    def __iter__(self):
        for word in self.words:
            yield word
        return


#generator: any python function that uses the 'yield' keyword.
#when called, returns a generator object

def gen_123():
    yield 1
    yield 2
    yield 3

g = gen_123()
next(g)
#1
next(g)
#2


######################################################################

#Arithmetic Progression Generator (using a class):
class ArithmeticProgression:
    def __init__(self, begin, step, end=None):
        self.begin = begin
        self.step = step
        self.end = end

    def __iter__(self):
        result = type(self.begin + self.step)(self.begin)
        forever = self.end is None
        index = 0
        while forever or result < self.end:
            yield result
            index += 1
            result = self.begin + self.step * index

#Arithmetic Progression Generator (using a generator function):
def aritprog_gen(begin, step, end=None):
    result = type(begin + step)(begin)
    forever = end is None
    index = 0
    while forever or result < end:
        yield result
        index += 1
        result = begin + step * index

#(using itertools)
import itertools

def aritprog_gen(begin, step, end=None):
    first = type(being + step)(begin)
    ap_gen = itertools.count(first, step)
    if end is not None:
        ap_gen = itertools.takewhile(lambda n: n < end, ap_gen)
    return ap_gen

######################################################################

# filter, enumerate, map, zip, reversed, all, any, max, min, sum
# itertools: compress, dropwhile, filterfalse, islice, takewhile, 
#            accumulate, starmap,
#            chain, chain.from_iterable, product, zip_longest,
#            combinations, combinations_with_replacement, count, cycle, permutations, repeat,
#            groupby, tee
# functools: reduce

######################################################################

#iter function with sentinel value
def d6():
    return randit(1, 6)

d6_iter = iter(d6, 1)
for roll in d6_iter:
    print(roll)

#<example outputs:>
#4
#3
#6
#3

#read until blank line
with open('mydata.txt') as fp:
    for line in iter(fp.readline, ''):
        process_line(line)

######################################################################

# 'else' without 'if':
#     for: the else block will run only if and then the for loop runs to completion
#     while: the else block will run only if and when the while loop exits because the
#             condition became falsy
#     try: the else block will only run if no exception is raised in the try block
# better keyword would be 'then'

#bad:
try:
    dangerous_call()
    after_call()
except OSError:
    log('OSError...')

#better:
try:
    dangerous_call()
except OSError:
    log('OSError...')
else:
    after_call()

######################################################################
#context managers:

#context manager protocol: __enter__ and __exit__ methods

#example:
class LookingGlass:

    def __enter__(self):
        import sys
        self.original_write = sys.stdout.write
        sys.stdout.write = self.reverse_write
        return 'JABBERWOCKY'

    def reverse_write(self, text):
        self.original_write(text[::-1])

    def __exit__(self, exc_type, exc_value, traceback):
        import sys
        sys.stdout.write = self.original_write
        if exc_type is ZeroDivisionError:
            print('Please DO NOT divide by zero!')
            return True


with LookingGlass() as what:    # 'what' is bound to the return value of __enter__
    print('hello')
    print(what)

#olleh
#YKCOWREBBAJ
what
#'JABBERWOCKY'


#same example using @contextmanager
import contextlib

@contextlib.contextmanager
def looking_glass():
    import sys
    original_write = sys.stdout.write

    def reverse_write(text):
        original_write(text[::-1])

    sys.stdout.write = reverse_write
    msg = ''
    try:
        yield 'JABBERWOCKY'
    except ZeroDivisionError:
        msg = 'Please DO NOT divide by zero!'
    finally:
        sys.stdout.write = original_write
        if msg:
            print(msg)

# the context manager decorator wraps the function in a class that implements __enter__ and __exit__
# the __enter__ method:
#     1. invokes the generator function and holds on to the generator object, call it "gen"
#     2. calls next(gen) to make it run to the yield keyword
#     3. returns the value yielded by next(gen), so it can be bound to a variable in the with/as form
# when the with block terminates, the __exit__ method:
#     1. checks if an exception was passed as exc_type; if so, gen.throw(exception) is invoked,
#         causing the exception to be raised in the yield line inside the generator function body
#     2. otherwise, next(gen) is called, resuming the execution of the generator function
#         body after the yield


######################################################################
#coroutines

def simple_coroutine():
    print('-> coroutine started')
    x = yield
    print('-> corountine received:', x)

my_coro = simple_coroutine()
next(my_coro)
# -> coroutine started
my_coro.send(42)
# -> coroutine received: 42
# Traceback (most recent call last):
# ...
# Stop Iteration


#A coroutine can be in one of four states. Call inspect.getgeneratorstate()
#to determine which
1.) 'GEN_CREATED' waiting to start
2.) 'GEN_RUNNING' currently being executed
3.) 'GEN_SUSPENDED' currently suspended at a yield expression
4.) 'GEN_CLOSED'


def simple_coro2(a):
    print('-> Started: a=', a)
    b = yield a
    print('-> Received: b=', b)
    c = yield a + b
    print('-> Received: c=', c)

my_coro2 = simple_coro2(14)
from inspect import getgeneratorstate
getgeneratorstate(my_coro2)
#'GEN_CREATED'
next(my_coro2)
#-> Started: a = 14
#14
getgeneratorstate(my_coro2)
#'GEN_SUSPENDED'
my_coro2.send(28)
#-> Received: b = 28
#42
my_coro2.send(99)
#-> Receiver: c = 99
#Traceback (most recent call last):
# File "<stdin>", line 1, in <module>
#Stop Iteration
getgeneratorstate(my_coro2)
#'GEN_CLOSED'

######################################################################

#running average using coroutines
def average():
    total = 0.0
    count = 0
    average = None
    while True:
        term = yield average
        total += term
        count += 1
        average = total/count

coro_avg = averager()
next(coro_avg)
coro_avg.send(10)
#10.0
coro_avg.send(30)
#20.0
coro_avg.send(5)
#15.0


#decorator for coroutine priming (so that you don't need to call next)
from functools import wraps

def coroutine(func):
    @wraps(func)
    def primer(*args, **kwargs):
        gen = func(*args, **kwargs)
        next(gen)
        return gen
    return primer
