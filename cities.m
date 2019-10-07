classdef cities
    properties (SetAccess = private)
        x
        y
    end
    methods
%constructor function
        function city = cities(max)
			if nargin == 1
				city.x = randi([0 max],1);
				city.y = randi([0 max],1);
			else
				city.x = -1;
				city.y = -1;
			end
		end
		
%checks if default
		function bool = check(obj)
			if obj.x == -1 || obj.y == -1
				bool = true;
			else
				bool = false;
			end 
		end
		
%==	override
		function bool = eq(obj1,obj2)
			if obj1.x == obj2.x && obj1.y == obj2.y
				bool = true;
			else
				bool = false;
			end
		end
		
%~= override
		function bool = ne(obj1,obj2)
			if obj1.x ~= obj2.x || obj1.y ~= obj2.y
				bool = true;
			else
				bool = false;
			end
		end
    end
end