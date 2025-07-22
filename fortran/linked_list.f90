program linked_list

implicit none

type :: Node
	integer :: value
	type(Node), pointer :: next => null()
end type Node

type(Node), pointer :: head => null()
type(Node), pointer :: current, new_node

call append(10)
call append(20)
call append(30)
call print_list()
call cleanup()

! Procedure declarations
contains

subroutine append(val)
	integer, intent(in) :: val
	type(Node), pointer :: temp

	allocate(new_node)
	new_node%value = val
	new_node%next => null()

	if (.not. associated(head)) then
		head => new_node
	else
		temp => head
		do while (associated(temp%next))
			temp => temp%next
		end do
		temp%next => new_node
	end if
end subroutine append

subroutine print_list()
	type(Node), pointer :: temp

	temp => head
	print *, "Linked list components:"
	do while (associated(temp))
		print *, temp%value
		temp => temp%next
	end do
end subroutine print_list

subroutine cleanup()
	type(Node), pointer :: temp

	do while (associated(head))
		temp => head
		head => head%next
		deallocate(temp)
	end do
end subroutine cleanup

end program linked_list
