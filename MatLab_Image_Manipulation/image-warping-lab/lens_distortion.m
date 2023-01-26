source = im2double(imread('window.jpg'));
target = zeros(size(source));

K = [474.53, 0, 405.96; 0, 474.3, 217.81; 0, 0, 1];
kValues = [-0.27194, 0.11517, -0.029859];

px = K(1, 3);
py = K(2, 3);
fx = K(1, 1);
fy = K(2, 2);

for dist_v = 1:size(target, 1)
    for dist_u = 1:size(target, 2)
        dist_x = (dist_u - px)/fx;
        dist_y = (dist_v - py)/fy;
        r_squared = dist_x.^2 + dist_y.^2;
        expression = 1+ kValues(1)*r_squared + kValues(2)*r_squared.^2 + kValues(3)*r_squared.^3;
        undist_x = dist_x .* expression;
        undist_y = dist_y .* expression;
        
%         undist_u = round(undist_x*fx + px);
%         undist_v = round(undist_y*fy + py);
        
        % Do bilinear interpolation with four neighbouring pixels

        undist_u = (undist_x*fx + px);
        undist_v = (undist_y*fy + py);
        
        f1 = [floor(undist_v), floor(undist_u)];
        f2 = [floor(undist_v), ceil(undist_u)];
        f3 = [ceil(undist_v), floor(undist_u)];
        f4 = [ceil(undist_v), ceil(undist_u)];
        
        alpha = ceil(undist_u) - floor(undist_u);
        beta = ceil(undist_v) - floor(undist_v);
        
        f12 = (1 - alpha) * f1 + alpha * f2;
        f34 = (1 - alpha) * f3 + alpha * f4;
        
        f1234 = (1 - beta) * f12 + beta * f34;
        
        undist_u = f1234(2);
        undist_v = f1234(1);
        
        if (undist_u > 0 && undist_v > 0 && undist_u <= size(target, 2) && undist_v <= size(target, 1))
            target(dist_v, dist_u, :) = source(undist_v, undist_u, :);
        end
       
    end
end

imshow([source target]);