# tag: cpp

import cython

cimport libcpp

cimport libcpp.array
cimport libcpp.deque
cimport libcpp.list
cimport libcpp.map
cimport libcpp.pair
cimport libcpp.queue
cimport libcpp.set
cimport libcpp.stack
cimport libcpp.vector
cimport libcpp.complex
cimport libcpp.limits

from libcpp.array  cimport *
from libcpp.deque  cimport *
from libcpp.list   cimport *
from libcpp.map    cimport *
from libcpp.pair   cimport *
from libcpp.queue  cimport *
from libcpp.set    cimport *
from libcpp.stack  cimport *
from libcpp.vector cimport *
from libcpp.complex cimport *
from libcpp.limits cimport *

cdef libcpp.array.array[int, 10]   a1 = array[int, 10]()
cdef libcpp.deque.deque[int]       d1 = deque[int]()
cdef libcpp.list.list[int]         l1 = list[int]()
cdef libcpp.map.map[int,int]       m1 = map[int,int]()
cdef libcpp.pair.pair[int,int]     p1 = pair[int,int](1,2)
cdef libcpp.queue.queue[int]       q1 = queue[int]()
cdef libcpp.set.set[int]           s1 = set[int]()
cdef libcpp.stack.stack[int]       t1 = stack[int]()
cdef libcpp.vector.vector[int]     v1 = vector[int]()

cdef array[int, 10].iterator ia1 = a1.begin()
cdef array[int, 10].iterator ia2 = a1.end()
cdef array[int, 10].reverse_iterator ria1 = a1.rbegin()
cdef array[int, 10].reverse_iterator ria2 = a1.rend()

cdef deque[int].iterator id1 = d1.begin()
cdef deque[int].iterator id2 = d1.end()
cdef deque[int].reverse_iterator rid1 = d1.rbegin()
cdef deque[int].reverse_iterator rid2 = d1.rend()

cdef list[int].iterator il1 = l1.begin()
cdef list[int].iterator il2 = l1.end()
cdef list[int].reverse_iterator ril1 = l1.rbegin()
cdef list[int].reverse_iterator ril2 = l1.rend()

cdef map[int,int].iterator im1 = m1.begin()
cdef map[int,int].iterator im2 = m1.end()
cdef map[int,int].reverse_iterator rim1 = m1.rbegin()
cdef map[int,int].reverse_iterator rim2 = m1.rend()
cdef pair[map[int,int].iterator, bint] pimb = m1.insert(p1)

cdef set[int].iterator is1 = s1.begin()
cdef set[int].iterator is2 = s1.end()
cdef set[int].reverse_iterator ris1 = s1.rbegin()
cdef set[int].reverse_iterator ris2 = s1.rend()
cdef pair[set[int].iterator, bint] pisb = s1.insert(4)

cdef vector[int].iterator iv1 = v1.begin()
cdef vector[int].iterator iv2 = v1.end()
cdef vector[int].reverse_iterator riv1 = v1.rbegin()
cdef vector[int].reverse_iterator riv2 = v1.rend()

def test_vector_coercion(*args):
    """
    >>> test_vector_coercion(1.75)
    [1.75]
    >>> test_vector_coercion(1, 10, 100)
    [1.0, 10.0, 100.0]
    """
    v = new vector[double]()
    for a in args:
        v.push_back(a)
    return [v[0][i] for i in range(v.size())]

def test_const_vector(*args):
    """
    >>> test_const_vector(1.75)
    [1.75]
    >>> test_const_vector(1, 10, 100)
    [1.0, 10.0, 100.0]
    """
    cdef vector[double] v
    for a in args:
        v.push_back(a)
    return const_vector_to_list(v)

cdef const_vector_to_list(const vector[double]& cv):
    cdef vector[double].const_iterator iter = cv.const_begin()
    cdef lst = []
    while iter != cv.const_end():
        lst.append(cython.operator.dereference(iter))
        cython.operator.preincrement(iter)
    return lst

cdef double dmax = numeric_limits[double].max()
cdef double dmin = numeric_limits[double].min()
cdef double deps = numeric_limits[double].epsilon()
cdef double dqnan = numeric_limits[double].quiet_NaN()
cdef double dsnan = numeric_limits[double].signaling_NaN()
cdef double dinf = numeric_limits[double].infinity()

cdef int imax = numeric_limits[int].max()
cdef int imin = numeric_limits[int].min()
cdef int ieps = numeric_limits[int].epsilon()
cdef int iqnan = numeric_limits[int].quiet_NaN()
cdef int isnan = numeric_limits[int].signaling_NaN()
cdef int iinf = numeric_limits[int].infinity()
