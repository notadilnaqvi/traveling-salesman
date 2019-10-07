classdef routes
	properties
		size
		distance
		fitness
		city = repmat(cities(),0)
	end
	methods
%constructor function
		function obj = routes(size)
			obj.size = size;
% 			populates route with cities
			for i=1:size
				obj.city(i) = cities(99);
			end
			obj.distance = obj.calcDist;
			obj.fitness = obj.calcFitness;
		end
		
%calculates route distance
		function tDist = calcDist(obj)
			tDist = 0;
			for i = 1:obj.size-1
			   currX = obj.city(i).x;
			   currY = obj.city(i).y;
			   nextX = obj.city(i+1).x;
			   nextY = obj.city(i+1).y;
			   tempD = sqrt((currX-nextX)^2+(currY-nextY)^2);
			   tDist = tempD + tDist;
			end
		end
		
%calculates route fitness
		function fitness = calcFitness(obj)
			fitness = 1/obj.distance^5; %<==============change fitness here
		end
		
%swaps cities in route
		function obj = swap(obj,i,j)
			temp = obj.city(i);
			obj.city(i) = obj.city(j);
			obj.city(j) = temp;
			obj.distance = obj.calcDist;
			obj.fitness = obj.calcFitness;
		end
		
%shuffles cities in route
		function obj = shuffle(obj,times)
			for counter = 1:times
				i = randi([1 obj.size],1);
				j = randi([1 obj.size],1);
				obj = swap(obj,i,j);
			end
		end
		
%mutates route
		function obj = mutate(obj,mutRate)
			if rand < mutRate
				i = randi([1 obj.size],1);
				j = randi([1 obj.size],1);
				obj = obj.swap(i,j);
			end
		end
		
%plots route cities
		function draw(obj,title)
			figure('Name',title,'NumberTitle','off','color','white');
			s = obj.size;
			for i = 1:s
				x(i,1) = obj.city(i).x;
				y(i,1) = obj.city(i).y;
				scatter(x,y,25,[0 0 1],'filled');
				hold on
			end
			plot(x,y,'b');
			scatter(x(1,1),y(1,1),25,'g','filled');
			scatter(x(s,1),y(s,1),25,'r','filled');
			axis([-5 105 -5 105]);
		end
	end
end