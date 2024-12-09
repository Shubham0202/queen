
function solve_n_queens(n)
    board = zeros(n, n);
    if place_queen(board, 1, n) then
        disp(board);
    else
        disp("No solution found.");
    end
endfunction

function flag = place_queen(board, row, n)
    if row > n then
        flag = 1;
        return;
    end

    for col = 1:n
        if is_safe(board, row, col, n) then
            board(row, col) = 1;
            if place_queen(board, row + 1, n) then
                flag = 1;
                return;
            end
            board(row, col) = 0;
        end
    end
    flag = 0;
endfunction

function flag = is_safe(board, row, col, n)
    for i = 1:row-1
        if board(i, col) == 1 then
            flag = 0;
            return;
        end
        if col - (row - i) >= 1 & board(i, col - (row - i)) == 1 then
            flag = 0;
            return;
        end
        if col + (row - i) <= n & board(i, col + (row - i)) == 1 then
            flag = 0;
            return;
        end
    end
    flag = 1;
endfunction

solve_n_queens(8);
