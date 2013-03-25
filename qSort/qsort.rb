# Robbie Perlstein
# Mar 25, 2013
# QuickSort in Ruby
# 
# Generates an random array of 1000 elements
# in the range (1, 1000). Uses quicksort to
# sort the array.

# This class is kind of unncessary.
class QSort

	private
	def swap( qArr, val1, val2 )
		qArr[val1], qArr[val2] = qArr[val2], qArr[val1]
	end
	
	def partition( qArr, left, right, pivot )
		pivotVal = qArr[pivot]
		swap( qArr, pivot, right )
		
		swapIndex = left
		for i in (left..(right-1))
			if qArr[i] < pivotVal 
				swap( qArr, i, swapIndex )
				swapIndex += 1
			end
		end
		swap( qArr, swapIndex, right )
		return swapIndex
	end
	
	def sort( qArr, left, right )
		if left < right then
			pivot = left + (right-left)/2
			pivot.floor
			pivot = partition( qArr, left, right, pivot )
			sort( qArr, left, pivot - 1 )
			sort( qArr, pivot + 1, right )
		end
	end
	
	public
	# Sort an entire array. Removes nil entries. 
	# All elements must be the same type, or 
	# undefined behavior is to be expected!
	# Returns the time needed to sort.
	def qSort( qArr )
		qArr.delete_if{ |x| x == nil }
		t1 = Time.now
		sort( qArr, 0, qArr.size-1 )
		t2 = Time.now
		return (t2 - t1)/1000
	end
end


a = Array.new
for i in 0...1000
	a.push( Random.rand( 1..1000 ) )
end
puts( a.size )
print( "\n\nQuick sort Ruby demo. Sort a random array with 1000 elements." )
print( "\nPress ENTER to continue...\n" )
gets
print( "Initial array: ", a, "\n\n" )
qSorter = QSort.new
time = qSorter.qSort( a )
print( "Sorted array: ", a )
print( "\nSorted in ", "%5.10f" % time, " seconds." )