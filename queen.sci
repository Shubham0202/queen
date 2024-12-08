
function isSafe(board, row, col, N)
    for i = 1:row-1
        if board(i, col) == 1 then
            return %F; // Return false if there's another queen in the same column
        end
    end
    for i = 1:row-1
        if col - (row - i) >= 1 & board(i, col - (row - i)) == 1 then
            return %F; 
        end
    end
    for i = 1:row-1
        if col + (row - i) <= N & board(i, col + (row - i)) == 1 then
            return %F; // Return false if there's another queen in the upper right diagonal
        end
    end
    
    return %T; 
endfunction
function solveNQueens(board, row, N)
    if row > N then
        disp(board);
        return %T; 
    end
    for col = 1:N
        if isSafe(board, row, col, N) then
            board(row, col) = 1; 
            if solveNQueens(board, row + 1, N) then
                return %T; // If the next row placement is successful, return true
            end
            board(row, col) = 0; // Remove the queen
        end
    end
    
    return %F; // If no position is found, return false
endfunction
function NQueens(N)
    board = zeros(N, N);
    

    if ~solveNQueens(board, 1, N) then
        disp("Solution does not exist.");
    end
endfunction
// Example usage: Solve the 4-Queens problem
N = 4;
NQueens(N);