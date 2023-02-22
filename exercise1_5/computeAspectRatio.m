function aRatio = computeAspectRatio(image)
    [num_rows, num_cols] = size(image);

    % Fill your code
    leftBorderRow = 1;
    rightBorderRow = num_rows;
    topBorderCol = 1;
    botBorderCol = num_cols;
    
    %% Main Idea is to keep refreshing our border values until we reach a point where the digit has started
    %%%% We can mainly work to minimize complexity with this algorithm
    
    for i=1:num_rows/2
        
        %From left to right
        if (sum(image(:,i)) == 0)
            leftBorderRow = i;
        end
        %From right to left
        if (sum(image(:,num_rows-i)) == 0)
            rightBorderRow = num_rows-i;
        end
        %From top to bot
        if (sum(image(i,:)) == 0)
            topBorderCol = i;
        end;
        %From bot to top
        if (sum(image(num_cols-i,:)) == 0)
            botBorderCol = num_cols-i;
        end
        
    end
    
    x = leftBorderRow;
    y = num_cols - botBorderCol;
    w = rightBorderRow - leftBorderRow;
    h = botBorderCol - topBorderCol;
    
    figure;
    imshow(image)
    hold on;
    rectangle('Position', [x y w h], 'Edgecolor', 'r')
    aRatio = abs((rightBorderRow - leftBorderRow)/ (topBorderCol - botBorderCol));
    
end

