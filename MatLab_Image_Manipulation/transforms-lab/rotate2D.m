close all;
clear all;

% A 2D pologyon: square of 2 by 2 units.
p = [-1 1 1 -1 -1 ; -1 -1 1 1 -1];

% Points in p are to be in homogeneous coordinates.
p(3,:) = 1;

% Transpose matrix
% p = p.';

% Set up axes for plotting our animation.
figure;
hold on;
axis equal; 

% The square should rotate about this point.
point = [3; 4];

 for theta = 0:0.01:2 * pi

    % Set up matrix R to be a rotation transformation
    % (anticlockwise about origin by angle theta).
    R = [cos(theta), -sin(theta), -point(1)*cos(theta)+point(2)*sin(theta)+point(1); sin(theta), cos(theta), -point(1)*sin(theta)-point(2)*cos(theta)+point(2); 0 0 1];
    
    % R for Post-Multiplication (Question 7.2)
%     R = [cos(theta), sin(theta), 0; - sin(theta), cos(theta), 0; - point(1) * cos(theta) + point(2) * sin(theta) + point(1), - point(1) * sin(theta)- point(2) * cos(theta) + point(2), 1];
    
    % Perform the transform R.
    pprime = R * p;
    
    % Perform post-applied transform
%     pprime = p * R;
    
    % Divide by homogeneous coordinate.
    pprime(1,:) = pprime(1,:) ./ pprime(3,:);
    pprime(2,:) = pprime(2,:) ./ pprime(3,:);
    
    % Divide by homogenous coordinate (NEW).
%     pprime(:,1) = pprime(:,1) ./ pprime(:,3);
%     pprime(:,2) = pprime(:,2) ./ pprime(:,3);
    
    % Plot polygon in pprime in blue, point in red.
    cla; % clear axes
    plot(pprime(1,:), pprime(2,:), 'b', 'LineWidth', 3);
    plot(point(1), point(2), 'r.', 'MarkerSize', 20);
    axis([-6 6 -6 6]);
    
    % Plot NEW polygon in pprime in blue, with point in red.
%     cla;
%     plot(pprime(:,1), pprime(:, 2), 'b', 'LineWidth', 3);
%     plot(point(1), point(2), 'r.', 'MarkerSize', 20);
%     axis([-6 6 -6 6]);
    
    drawnow;
 end
