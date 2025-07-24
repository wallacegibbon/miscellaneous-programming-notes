program test_array

integer :: a(2, 3)
integer :: b(2, 3)

data a / 1, 2, 3, 4, 5, 6 /

b = reshape((/ 1, 2, 3, 4, 5, 6 /), (/ 2, 3 /))

call show_arr_2x3(a)
call show_arr_2x3(b)

end program test_array

subroutine show_arr_2x3(arr)

	integer, intent(in) :: arr(2, 3)
	integer :: i, j

	print *, "Array Content:"

	do i = 1, 2
		!! the construct generate: arr(i, 1), arr(i, 2), arr(i, 3)
		write(*, '(3I6)') (arr(i, j), j = 1, 3)
	end do

end subroutine show_arr_2x3
