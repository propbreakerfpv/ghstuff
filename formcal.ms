// takes a list of lines 

formcal = function(list)
	// rows is a function that taks a list of string columns and returns a list of lists of string rows
	if list.len == 0 then return
	//print(list)
	rows = function(list)
		col = []
		i = 0
		while i < list[0].split(" ").len
			col.push([])
			i = i + 1
		end while
		for i in list
			ind = 0
			for l in i.split(" ")
				//print(col)
				col[ind].push(l)
				ind = ind + 1
			end for
		end for
		return col
	end function

	col2 = rows(list)// cal2 is for being cleaned
	col = rows(list)// cal is to be left with the tags in

	ind = 0
	for i in col2 // removeing the tags of cal2
		ind1 = 0
		for l in i
			indl = l.indexOf("<")
			indr = l.indexOf(">")
			while indl != null and indr != null
				if indl == 0 then
					col2[ind][ind1] = col2[ind][ind1][indr+1:]

				else if col2[ind][ind1][indr+1:] == null then
					col2[ind][ind1] = col2[ind][ind1][:indl]

				else
					col2[ind][ind1] = col2[ind][ind1][:indl] + col2[ind][ind1][indr+1:]

				end if
				indl = col2[ind][ind1].indexOf("<")
				indr = col2[ind][ind1].indexOf(">")
			end while
			ind1 = ind1 + 1
		end for
		ind = ind + 1
	end for



	biglist = [] // find the len of the longgest item in cal2
	for i in col2
		big = 0
		for l in i
			if l.len > big then big = l.len
		end for
		biglist.push(big)
	end for

	ind = 0
	for i in col2 // add space to cal using cal2 as the len
		ind1 = 0
		for l in i
			add = biglist[ind] - l.len
			while add > 0
				col[ind][ind1] = col[ind][ind1] + " "
				add = add - 1
			end while
			add = 0
			ind1 = ind1 + 1
		end for
		ind = ind + 1
	end for

	out = []
	for i in range(0, list.len) // rearange stuff
		out.push([])
	end for

	for i in col // rearange stuff
		ind = 0
		for l in i
			out[ind].push(l)
			ind = ind + 1
		end for
	end for

	for i in out // print
		print(i.join("  "))
	end for
end function
