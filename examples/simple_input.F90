program simple_input
    use, intrinsic :: iso_fortran_env, only: real64
    use glf90w

    implicit none
    type(GLFWwindow) :: window
    integer :: ierr

    call glfwInit(ierr)
    if (ierr /= 0) then
        stop 'Error whilst initialising GLFW'
    end if

    window = glfwCreateWindow(800, 600, 'Hello World')
    if (.not. associated(window)) then
        call glfwTerminate()
        stop 'Error whilst creating window'
    end if

    call glfwSetKeyCallback(window, key_interact)
    call glfwSetScrollCallback(window, mouse_scroll)
    call glfwSetCursorPosCallback(window, cursor_pos)
    call glfwMakeContextCurrent(window)

    do
        call glfwPollEvents()

        call glfwSwapBuffers(window)
        if (glfwWindowShouldClose(window)) exit
    end do

    call glfwDestroyWindow(window)
    call glfwTerminate()

    contains

        subroutine key_interact(window, key, scancode, action, mods)
            implicit none
            type(GLFWwindow), intent(in) :: window
            integer, intent(in) :: key, scancode, action, mods

            if (action == GLFW_PRESS) then
                write(6, *) 'Key pressed: ', key
            else if (action == GLFW_RELEASE) then
                write(6, *) 'Key released: ', key
            end if
        end subroutine key_interact

        subroutine mouse_scroll(window, xoffset, yoffset)
            implicit none
            type(GLFWwindow), intent(in) :: window
            real(real64), intent(in) :: xoffset, yoffset

            write(6, *) 'Mouse scrolled: x =', xoffset, ' y =', yoffset
        end subroutine mouse_scroll

        subroutine cursor_pos(window, x, y)
            implicit none
            type(GLFWwindow), intent(in) :: window
            real(real64), intent(in) :: x, y

            write(6, *) 'Cursor position: x =', x, ' y =', y
        end subroutine cursor_pos

end program simple_input
