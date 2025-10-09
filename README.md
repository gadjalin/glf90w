# GLF90W

&nbsp;&nbsp; *"Because why not."*

---

## Introduction

GLF90W provides complete Fortran bindings for the [GLFW](https://www.glfw.org) C library version 3.4.

It is made so that users already accustomed to the C library can
straightforwardly start writing equivalent Fortran code using the binding, with
a few exceptions meant to better fit the Fortran programming style.

It almost entirely hides the C-interoperability part so that the user should not
have to worry about using the `iso_c_binding` module.
Only [custom allocator callbacks](https://www.glfw.org/docs/latest/intro_guide.html#init_allocator)
and user-pointer-related functions (`glfwSet*UserPointer` and
`glfwGet*UserPointer`) still require the user to provide or handle `type(c_ptr)` inputs.
This is because custom allocators should probably be written in C in any way,
and user pointers are meant to give the user as much freedom as possible, which
is harder to achieve in Fortran due to its more limiting type system.

I started this project initially as a challenge to get comfortable with the Fortran language.
I use it and maintain it on my free time and for personal projects, and I have
not fully tested the port.
Consequently, if you have any request, suggestion for improvements, or if you found something that does not behave as expected, you are
invited to open a [github issue](https://github.com/gadjalin/glf90w/issues) or a [pull request](https://github.com/gadjalin/glf90w/pulls).
It is very welcome!

This binding is maintained by [Gaétan J.A.M. Jalin](https://github.com/gadjalin/).

Table of Contents
=================

* [GLF90W](#glf90w)
   * [Introduction](#introduction)
   * [Compilation](#compilation)
      * [Fortran 2023 compatibility](#fortran-2023-compatibility)
   * [Usage](#usage)
      * [Opaque pointers](#opaque-pointers)
      * [Logicals](#logicals)
      * [Pointer arguments](#pointer-arguments)
      * [Arrays](#arrays)
      * [Strings](#strings)
      * [Callbacks](#callbacks)
   * [Contact](#contact)

## Compilation

This project uses CMake to compile.
The only requirements are a Fortran compiler supporting the 2018 standard
(and including a preprocessor) and CMake.
However, this repository includes GLFW as a submodule ([version 3.4](https://github.com/glfw/glfw/commits/3.4))
so that it may be compiled together with GLF90W.
Please refer to the [GLFW documentation](https://www.glfw.org/docs/latest/compile.html) for information about
GLFW's dependencies before compiling.

Because the Fortran language is not ABI compatible (and I will not provide
precompiled binaries for every platform and compiler version imaginable), it is
usually required to compile every project and their dependencies using the same
compiler and compiler version. This is especially true for libraries that must
provide their module (.mod) files as well.
The C language, on the other hand, being ABI compatible, it is technically not
required to compile the base GLFW library yourself to link GLF90W.
However, it is recommended as the CMake script is based on this assumption.

The first step is to clone this repository:
```
git clone --recurse-submodules https://github.com/gadjalin/glf90w.git
```
This will also initialise the GLFW submodule.

You can then use CMake to compile GLF90W, e.g. on macOS and Linux:
```
cd glf90w
cmake -DBUILD_SHARED_LIBS=OFF -B bin
cmake --build bin
```
It is usually recommended to build a static library by setting the CMake `BUILD_SHARED_LIBS` variable to `OFF`.
In the same way, you can also set the `CMAKE_BUILD_TYPE` variable to `Debug` to build a debug version (minimal compiler optimisation and debug symbols).
By default, `BUILD_SHARED_LIBS` is `OFF` and `CMAKE_BUILD_TYPE` is `Release` (full compiler optimisation and no debug symbols).

On Windows, the exact process may vary depending on your environment. You may
use tools like Visual Studio Code, MinGW, and others, such as CMake GUI.

Finally, you may include GLF90W as a build step in your own projects' CMake scripts by adding it as a subdirectory:
```
ADD_SUBDIRECTORY(path_to_glf90w)
...
TARGET_LINK_LIBRARIES(... glf90w ...)
```

### Fortran 2023 compatibility

The Fortran 2023 standard introduced two new intrinsic routines to the
`iso_c_binding` module to deal with C-interoperability. Those are `f_c_string`
and `c_f_strpointer`, used to convert Fortran strings to C, null-terminated
strings, and back from a C `char const*` to a Fortran `character` scalar, repectively.

GLF90W implements its own, purpotedly standard-compliant, versions of these functions for backward compatibility
with older standards, but can be deactivated in case the user wishes to use the
intrinsic ones instead.
Because some compilers do not yet fully support this standard, the two routines
can be deactivated seperately using preprocessor macros.

 - Define `GLF90W_USE_INTRINSIC_F_C_STRING` to deactivate the custom `f_c_string`
implementation (and rely on the intrinsic).
 - Define `GLF90W_USE_INTRINSIC_C_F_STRPOINTER` to deactivate the custom `f_c_string`
implementation (and rely on the intrinsic).

This can be done using CMake by adding these options to the command line:

`-DGLF90W_USE_INTRINSIC_F_C_STRING` and `-DGLF90W_USE_INTRINSIC_C_F_STRPOINTER`

## Usage

GLF90W is made so that essential knowledge of the Fortran language and the
official [GLFW C Documentation](https://www.glfw.org/docs/latest/) should
mostly be enough to figure out how to do things.

A basic working example is given [here](examples/simple_window.F90) to reflect
[this simple C example](https://www.glfw.org/documentation.html).

There are however a few subtleties, introduced as a consequence of Fortran not
being C, that deserve a clear explanation for the unsure user.

### Opaque pointers

GLFW uses a few opaque pointer types such as `GLFWwindow`, `GLFWmonitor`, etc.
so that the user does not have to worry about the actual, platform-dependent
implementation.
Creating a window looks like this:
```c
GLFWwindow* window = glfwCreateWindow(...);
if (!window)
{
    // Error
    return -1;
}
```
and the user can check if things went well by testing if the `window`
pointer is not null.

However, Fortran pointers work quite differently from the C pointers.
The equivalent Fortran code looks like this:
```fortran
type(GLFWwindow) :: window

window = glfwCreateWindow(...)
if (.not. associated(window)) then
    ! Error
    stop -1
end if
```
The catch is that the `GLFWwindow` type still acts as an opaque type and can be
tested with the Fortran pointer semantic, reproducing the C logic, but is not declared using
the `pointer` attribute. This can be confusing, however, it also simplifies
the syntax and makes it more natural (removing the pointer assignement `=>`).

Under the hood, opaque types such as `GLFWmonitor` contain a `type(c_ptr)`
component that is the actual C `GLFWmonitor*` handle, which can be accessed
using for example `monitor % handle`, if need be.
Note that the `GLFWwindow` type is slightly more complicated as all created windows must
be tracked for their associated callbacks, and the `type(c_ptr)` handle can be
accessed using `window % handle % handle` instead.

### Logicals

The C language does not have a `bool` type as in C++, and use integers instead.
But Fortran has a much appreciated `logical` type.
As a consequence, there are a couple of GLFW functions that return or take
variables meant to be treated as booleans using the `GLFW_FALSE` and
`GLFW_TRUE` constants.
GLF90W makes use of the `logical` type instead, so that functions like
`glfwWindowShouldClose` can naturally be included in `if` statements.

This is not true for every function that return GLFW_FALSE/TRUE to indicate
success or failure.
Functions where such a return value *could* be ignored instead use the
"Fortranic" `ierr` optional argument.
Practically, the `glfwInit`, `glfwUpdateGamepadMappings`, and
`glfwGetGamepadState` do not return a `logical`, but are instead `subroutine`s
taking an optional integer `ierr`.
If the user decides not to ignore this value, the idiom is as follows
```fortran
call glfwInit(ierr)
if (ierr /= 0) then
    ! Error
    stop -1
end if
```

### Pointer arguments

In the same fashion, the C language is what is known as a pass-by-value
language, whereas Fortran is pass-by-reference.
This means that where the Fortran language can use subroutines and the `intent(out)`
attribute to return values to the user through one of the routine's input
arguments, the C language must ask the user for pointers.
On the other hand, this means that the output can be ignored by passing `NULL`
to the C function (assuming it can handle this case), whereas something must be
passed to the Fortran routine, unless the dummy argument is marked as `optional`.

There are a few GLFW functions that rely on this mechanic to return multiple
values to the user. For example `glfwGetCursorPos` takes two `double*` to store
the result, but these can be ignored by passing `NULL`.
To mimic this behaviour and allow the user to ignore certain return arguments, the
arguments in question are marked as `optional` in the Fortran binding, so that
doing:
```fortran
call glfwGetCursorPos(window, ypos=y)
```
is equivalent to the following C code:
```c
glfwGetCursorPos(window, NULL, y);
```

This logic applies to function pointers as well, where the `glfwSet*Callback`
collection of functions can take a `NULL` function pointer to reset a callback, in which
case the Fortran binding marks it as optional in the same way, so
that:
```fortran
call glfwSetWindowCloseCallback(window)
```
will deactivate the window close callback for this window as the following C
code would:
```c
glfwSetWindowCloseCallback(window, NULL);
```

Callback-related routines such as this also have the ability to return a
pointer to the previously used user callback. This case is discussed a [little
further](#callbacks).

### Arrays

Some functions take or return arrays (in the form of C pointers), such as
`float const* glfwGetJoystickAxes(int jid, int* count)`.
Such functions usually take additional arguments (here the `count` argument) to specify the size of the array.
Because the Fortran array and pointer semantics are vastly different from the C
ones, the user can either use a `pointer` and the pointer assignment `=>`, or
make a copy by using a normal assignment on a non-pointer variable, i.e
```fortran
real(kind=real32), dimension(:), pointer :: axes
axes => glfwGetJoystickAxes(jid)
! vs
real(kind=real32), dimension(:), allocatable :: axes
axes = glfwGetJoystickAxes(jid)
```
in either case, a `count` argument is not necessary as it can be obtained by
doing `size(axes)` instead.

### Strings

Again, C strings work very differently from the Fortran `character` type.
Fortunately, GLF90W takes care of the conversion for you.

As such, it should be noted that functions taking strings as input, such as
`glfwCreateWindow` or `glfwWindowHintString`, must make copies of the Fortran
strings before passing them to the C code. This is however not true for
functions returning strings.

GLFW functions always handle strings using pointers, as is usually done in C.
For this reason, it is specified in the official documentation when those are pointers to static strings (not dynamically allocated),
or are pointers to memory whose allocation is handled by GLFW, and that the user
should not `free`, or use out of their defined scope.
The corresponding Fortran GLF90W routines do not make copies of these strings,
and use them as C pointers, simply casting them to Fortran pointers in
the appropriate way.

However, the user on the Fortran side is not enforced to use pointers. Using an
allocatable Fortran string to retrieve the return value of a GLF90W routine
will allocate a new string and make a copy of the returned one:
```fortran
type(GLFWwindow) :: window
character(len=:), allocatable :: title
...
title = glfwGetWindowTitle(window) ! Normal assignment to an allocatable scalar copies the returned string!
```

If the user does not wish to make a copy, then a
`pointer` variable and pointer assignment must be used:
```fortran
character(len=:), pointer :: version
...
version => glfwGetVersionString() ! Pointer assignment to a pointer variable retrieves the original GLFW pointer
```

### Callbacks

GLFW provides the user with callback facilities to handle events such as
internal errors, keyboard interactions or context changes. The user-provided callback 
routines must match a certain signature for this to work.

GLF90W introduces callback wrappers to handle the C-interopability with GLFW,
such as string conversions and the pass-by-value-pass-by-reference extravaganza.
This way, the user may provide plain Fortran callback routines and not have to
worry about the fact that GLFW will call them with C standards, while still
matching the signature expected by the C code, with a mostly straightforward
translation to Fortran.

The expected signatures for the callback routines can be found in the GLFW
Documentation for the C language, and the translation to Fortran should be straightforward for most of them
(`char const*` becomes `character(*)`, `GLFWwindow*` becomes `type(GLFWwindow)`, etc).
However, some Fortran interfaces, such as `GLFWcursorenterfun` use the `logical`
type where this is, well, logical.
Also note that `GLFWscrollfun` for the mouse scroll callback takes `double`s!

The exact expected Fortran interfaces can be found in the [glf90w.F90](src/glf90w.F90)
file around line 550.

This is an example of setting a callback for the mouse scroll event
```fortran
program
    ! The GLFWscrollfun signature takes doubles!
    use, intrinsic :: iso_fortran_env, only: real64
    use glf90w

    ...
    call glfwSetScrollCallback(window, mouse_scroll)
    ...

    contains

        subroutine mouse_scroll(window, xoffset, yoffset)
            implicit none
            type(GLFWwindow), intent(in) :: window
            real(kind=real64), intent(in) :: xoffset, yoffset

            write (6, '(A)') 'Mouse scrolled!'
        end subroutine mouse_scroll

end program
```

One less straightforward routine is the `GLFWdropfun` callback, which is called when file paths are drag-and-dropped over the window.
In C, this function expects a `char const*[]` (an array of strings).
The corresponding Fortran signature for this callback acts in a slightly more subtle way:
```fortran
subroutine drop(window, paths)
    implicit none
    type(GLFWwindow), intent(in) :: window
    character(len=:), dimension(:), pointer, intent(in) :: paths
end subroutine drop
```
It takes a pointer to an allocated character array actual argument.
Note that the `path_count` argument found in the C signature has disappeared as
well, as it is implicitly passed in Fortran and can be retrieved using `size(paths)`.
Then, all character strings in the array have the same length, given by `len(paths)`, due to Fortran
limitations, and correspond to the length of the longest string found in the
array. So remember to `trim` when manipulating these strings.

Lastly, each routine in the `glfwSet*Callback` collection can return a pointer
to the routine that was previously being used for this callback, or `NULL` if it was not set.
In C, this pointer is the return value and can easily be ignored.
In Fortran, `function`s cannot be `call`ed (in principle),
and that would make it cumbersome to have to perform an assignment each time a
callback is set.
To palliate this, the `glfwSet*Callback` family of rountines are defined as
`subroutine`s and take an additional, optional, intent(out) argument that will
be filled with a pointer to the previous callback if present.

To reset a callback, simply don't pass one, as shown in [the previous
section](#pointer-arguments).

Some example codes show how callbacks can be used:
 - The [simple_window.F90 example](examples/simple_window.F90) shows how to setup an
error callback.
 - The [simple_input.F90 example](examples/simple_input.F90) shows how to use
other user-input-related callbacks.

## Contact

If you have any suggestion, request, found a bug, or have an improvement to submit,
please file an [issue](https://github.com/gadjalin/glf90w/issues) or [pull request](https://github.com/gadjalin/glf90w/pulls) accordingly.

## Licence

zlib, same as [GLFW](https://www.glfw.org) (See [LICENCE](LICENCE) file)

