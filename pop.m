classdef pop
	properties
		size
		route = repmat(routes(2),0)
	end
	methods
%constructor function
		function obj = pop(inRoute, size)
			obj.size = size;	
	%populates population with routes
			for i = 1:size
				times = randi([1 size],1);
				obj.route(i) = inRoute.shuffle(times);
			end
		end

% returns population routes distances
		function allDist = allDist(obj)
			allDist = zeros(obj.size,1);
			for i = 1:obj.size
				allDist(i,1) = obj.route(i).distance;
			end
		end
		
%normalizes route fitness
		function normFitness = normFitness(obj)
			tFitness = 0;
			for i = 1:obj.size
				tempF = obj.route(i).fitness;
				tFitness = tFitness + tempF;
			end
			normFitness = zeros();
			for i = 1:obj.size
				normFitness(i) = obj.route(i).fitness/tFitness;
			end
		end
		
%picks a random route
		function pickedR = pickOne(obj)
			index = 1;
			fitness = obj.normFitness;
			r = rand;
			while(r > 0)
				r = r - fitness(index);
				index = index+1;
			end
			index = index-1;
			pickedR = obj.route(index);
		end
		
% generates next generation
		function obj = nextGen(obj)
			for i = 1:obj.size
				picked = pickOne(obj);
				mutated = picked.mutate(0.1);%<=============mutation rate
				obj.route(i) = mutated;
			end
		end
	end
end