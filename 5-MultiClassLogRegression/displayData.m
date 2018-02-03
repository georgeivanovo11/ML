%DISPLAYDATA Display 2D data in a nice grid

function [h, display_array] = displayData(X)

m = size(X, 1); 
n = size(X, 2); 

example_width = round(sqrt(n));
example_height = n / example_width;

num_rows = floor(sqrt(m));
num_cols = ceil(m / num_rows);

pad = 1; %between images padding

table = ones(pad+num_rows*(example_height+pad), pad + num_cols*(example_width+pad));

ex_index=1; %current example index 

for i = 1:num_rows
	for j = 1:num_cols
		if(ex_index > m)
			break;
		end;

		max_val = max(abs(X(ex_index,:)));
		ex_value = reshape(X(ex_index,:),example_height,example_width)/max_val;

		table (pad + (i-1)*(example_height+pad) + (1:example_height), ...
			   pad + (j-1)*(example_width+ pad) + (1:example_width )) ...
			  = ex_value;

		ex_index = ex_index + 1;
	end;
end;

colormap(gray);
imagesc(table,[-1,1]);
axis image off;
drawnow;
end;
