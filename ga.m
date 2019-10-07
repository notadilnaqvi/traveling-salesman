clc,clear
rng(999);
cities = 20; %2,432,902,008,176,640,000, 28 days
popSize = 100;
route = routes(cities);
route.draw('Innitial Route');
pop = pop(route, popSize);
disp(['Min: ', num2str(min(pop.allDist))]);
disp(['Max: ', num2str(max(pop.allDist))]);

gen = 500;
temp = zeros(gen, 1);
for counter = 1:gen
	pop = pop.nextGen;
	temp(counter) = mean(pop.allDist);
end

bestDist = inf;
for counter = 1:popSize
	tempD = pop.route(counter).distance;
	if tempD < bestDist
		bestRoute = pop.route(counter);
		bestDist = tempD;
	end
end
bestRoute.draw('Best Route');
disp(bestRoute.distance);
disp(['After ', num2str(gen), ' generations...']);
disp(['Min: ', num2str(min(pop.allDist))]);
disp(['Max: ', num2str(max(pop.allDist))]);
% figure(1);
% plot(temp);
% axis([1 gen 300 1000]);
disp('Finished!');