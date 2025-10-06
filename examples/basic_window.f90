program basic_window
    use glf90w

    implicit none
    type(GLFWwindow) :: window
    integer :: ierr

    call glfwSetErrorCallback(handle_error)

    call glfwInit(ierr)
    if (ierr /= 0) &
        stop 'glfwInit()'

    window = glfwCreateWindow(800, 600, 'Hello World')
    if (.not. associated(window)) then
        call glfwTerminate()
        stop 'glfwCreateWindow()'
    end if

    call glfwMakeContextCurrent(window)

    do
        call glfwPollEvents()

        if (glfwWindowShouldClose(window)) exit
    end do

    call glfwDestroyWindow(window)
    call glfwTerminate()

    contains

        subroutine handle_error(code, desc)
            implicit none
            integer, intent(in) :: code
            character(*), intent(in) :: desc

            print '(''Error '', I8,'' : '',A)', code, desc
        end subroutine handle_error

end program basic_window
