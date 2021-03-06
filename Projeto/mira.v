module mira (clk, nrst, updown, cnt_en, row, column, s, rightleft);
	
	input clk, nrst, updown, cnt_en, rightleft;
	input [9:0] row, column;
	output reg s;
	integer count = 0;
	integer count1 = 0;
	
	always @*
	begin
		if ( row < count1 + 230 & count1 + 200 < row & column < count + 100 & count + 70 < column )
			s = 1;
		else
			s = 0;
	end
	
	always @(posedge clk)
	begin
		if(nrst == 0)
			count = 0;
		else if(cnt_en == 1)
			if(updown == 1)
				count1 = count1 + 5;
			else if (updown == 0)
				count1 = count1 - 5;
			if(cnt_en == 1)
				if(rightleft == 0)
					count = count + 5;
				else if (rightleft == 1)
					count = count - 5;
				
		if(count > 640)
			count = 0;
		else if(count < -1)
			count = 640;
		
		if(count1 > 480)
			count1 = 0;
		else if(count1 < -1)
			count1 = 480;
			
	end
	
endmodule 